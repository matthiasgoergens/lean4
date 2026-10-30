# Prints the fully qualified names of the theorems declared in a Lean file (namespaces tracked).
import re, sys
ns = []
for line in open(sys.argv[1]):
    m = re.match(r'namespace (\S+)', line)
    if m: ns.append(m.group(1)); continue
    m = re.match(r'end (\S+)\s*$', line)
    if m and ns and ns[-1] == m.group(1): ns.pop(); continue
    m = re.match(r'(?:@\[[^\]]*\]\s*)?(?:private\s+)?theorem\s+(\S+)', line)
    if m: print('.'.join(ns + [m.group(1)]))
