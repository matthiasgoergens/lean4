# Well below the test's 1000 rejected calls, so leaking one descriptor per call exhausts it.
# Windows reads random bytes without a file descriptor.
[[ "$OSTYPE" == cygwin || "$OSTYPE" == msys ]] || ulimit -S -n 256
