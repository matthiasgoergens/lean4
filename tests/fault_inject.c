/*
Fault injection for tests of the runtime's error paths. `compile/run_test.sh` builds this file as a
shared library and loads it with `LD_PRELOAD` into a test whose `.init.sh` sets `TEST_FAULTS` (Linux
only). The environment variables listed there choose which calls fail:

- `LEAN_FAULT_FDOPEN=ERRNO`: every `fdopen` fails with `ERRNO`.
- `LEAN_FAULT_OPEN=PATH:SKIP:ERRNO`: every `open` of `PATH` after the first `SKIP` fails with `ERRNO`.

`ERRNO` is a name such as `ENOMEM`. At exit the library prints how many calls it made fail, so the
test's expected output also checks that the injection took effect.
*/
#define _GNU_SOURCE
#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>

static const struct {
    const char * name;
    int value;
} errnos[] = {
    {"EACCES", EACCES}, {"EIO", EIO}, {"EMFILE", EMFILE}, {"ENOMEM", ENOMEM}, {"ENOSPC", ENOSPC},
};

static int parse_errno(const char * name) {
    for (size_t i = 0; i < sizeof(errnos) / sizeof(errnos[0]); i++) {
        if (strcmp(name, errnos[i].name) == 0) return errnos[i].value;
    }
    fprintf(stderr, "fault_inject: unknown errno name '%s'\n", name);
    abort();
}

/* Updated atomically, since a Lean program can make these calls from several threads. */
static unsigned long failed = 0;

static void count_failure(void) { __atomic_add_fetch(&failed, 1, __ATOMIC_RELAXED); }

__attribute__((destructor)) static void report(void) {
    fflush(stdout);
    fprintf(stderr, "fault_inject: made %lu calls fail\n", __atomic_load_n(&failed, __ATOMIC_RELAXED));
}

/* Returns the errno to fail this `open` of `path` with, or 0 to let it through. */
static int open_fault(const char * path) {
    static unsigned long seen = 0;
    const char * spec = getenv("LEAN_FAULT_OPEN");
    if (spec == NULL) return 0;
    const char * skip = strchr(spec, ':');
    const char * err = skip ? strchr(skip + 1, ':') : NULL;
    if (err == NULL) {
        fprintf(stderr, "fault_inject: LEAN_FAULT_OPEN must be PATH:SKIP:ERRNO, got '%s'\n", spec);
        abort();
    }
    if (strlen(path) != (size_t)(skip - spec) || strncmp(path, spec, skip - spec) != 0) return 0;
    if (__atomic_add_fetch(&seen, 1, __ATOMIC_RELAXED) <= strtoul(skip + 1, NULL, 10)) return 0;
    return parse_errno(err + 1);
}

/* Whether `open` was passed a mode, as glibc decides it (`O_TMPFILE` includes `O_DIRECTORY`). */
#ifdef __OPEN_NEEDS_MODE
#define TAKES_MODE(flags) __OPEN_NEEDS_MODE(flags)
#else
#define TAKES_MODE(flags) (((flags) & O_CREAT) != 0)
#endif

#define WRAP_OPEN(name)                                                                            \
    int name(const char * path, int flags, ...) {                                                 \
        static int (*real)(const char *, int, ...);                                               \
        mode_t mode = 0;                                                                           \
        if (TAKES_MODE(flags)) {                                                                   \
            va_list ap;                                                                            \
            va_start(ap, flags);                                                                   \
            mode = va_arg(ap, mode_t);                                                             \
            va_end(ap);                                                                            \
        }                                                                                          \
        int err = open_fault(path);                                                                \
        if (err != 0) {                                                                            \
            count_failure();                                                                       \
            errno = err;                                                                           \
            return -1;                                                                             \
        }                                                                                          \
        if (real == NULL) real = (int (*)(const char *, int, ...))dlsym(RTLD_NEXT, #name);        \
        return real(path, flags, mode);                                                            \
    }

WRAP_OPEN(open)
WRAP_OPEN(open64)

FILE * fdopen(int fd, const char * mode) {
    static FILE * (*real)(int, const char *);
    const char * spec = getenv("LEAN_FAULT_FDOPEN");
    if (spec != NULL) {
        count_failure();
        errno = parse_errno(spec);
        return NULL;
    }
    if (real == NULL) real = (FILE * (*)(int, const char *))dlsym(RTLD_NEXT, "fdopen");
    return real(fd, mode);
}
