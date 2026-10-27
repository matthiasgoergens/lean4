# Make every `fdopen` fail, and keep temporary files in a directory of this test's own.
TEST_FAULTS=(LEAN_FAULT_FDOPEN=ENOMEM TMPDIR=_tmp_16009)
