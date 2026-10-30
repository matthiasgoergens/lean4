#!/usr/bin/env python3
# Inserts the contents of a snippet file before the last `end Pdq` of a Lean file.
import sys
p, snip = sys.argv[1], sys.argv[2]
s = open(p).read()
j = s.rindex('end Pdq')
s = s[:j] + open(snip).read() + '\n' + s[j:]
open(p, 'w').write(s)
