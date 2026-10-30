#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Prints the partitions of ranges of at least MIN elements, in order, for a model run."""
import sys
sys.path.insert(0, __import__("os").path.dirname(__file__))
import model

algo, pat, n, mn = sys.argv[1], sys.argv[2], int(sys.argv[3]), int(sys.argv[4])
st, _ = model.run(algo, "nat", pat, n)
for d, size, left, kind in st.partitions:
    if size >= mn:
        print(f"d={d:3} size={size:7} left={left:7} frac={left / size:.4f} {kind}")
print("heaps:", [h for h in st.heaps if h[1] >= mn])
