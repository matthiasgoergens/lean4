// sortref ALGO TYPE PATTERN N: the inputs of ../Main.lean, sorted by Go's library.  Prints the time
// of the sort alone, the same hash of the result as the Lean harness, and the number of
// comparisons.
//
// ALGO: pdq (slices.SortFunc, pattern-defeating quicksort), stable (slices.SortStableFunc).
// TYPE: nat (the value is the key), pair (a 20-bit tag below the key, only the key compared).
package main

import (
	"fmt"
	"math"
	"os"
	"slices"
	"strconv"
	"time"
)

func xorshift(x uint64) uint64 {
	x ^= x << 13
	x ^= x >> 7
	x ^= x << 17
	return x
}

func randoms(n int) []uint64 {
	x := uint64(88172645463325252)
	a := make([]uint64, n)
	for i := range a {
		x = xorshift(x)
		a[i] = x
	}
	return a
}

func isqrt(n int) uint64 {
	s := uint64(math.Sqrt(float64(n)))
	for s*s > uint64(n) {
		s--
	}
	for (s+1)*(s+1) <= uint64(n) {
		s++
	}
	return s
}

func pattern(name string, n int) []uint64 {
	r := randoms(n)
	a := make([]uint64, n)
	N := uint64(n)
	for i := range a {
		I := uint64(i)
		switch name {
		case "random":
			a[i] = r[i] >> 2
		case "dups4":
			a[i] = r[i] % 4
		case "dupsqrt":
			a[i] = r[i] % isqrt(n)
		case "constant":
			a[i] = 0
		case "sorted", "nearly":
			a[i] = I
		case "reversed":
			a[i] = N - I
		case "organ":
			if i < n/2 {
				a[i] = I
			} else {
				a[i] = N - I
			}
		case "tripledesc":
			a[i] = 1<<62 - r[i%(n/3+1)]>>2
		case "pathological":
			if i+1 == n {
				a[i] = 0
			} else {
				a[i] = I + 1
			}
		case "runs2":
			if i < n/2 {
				a[i] = 2 * I
			} else {
				a[i] = 2*(I-N/2) + 1
			}
		case "runs16":
			m := N/16 + 1
			a[i] = (I%m)*16 + I/m
		case "sortedtail":
			if i < n-n/64 {
				a[i] = I << 20
			} else {
				a[i] = r[i] >> 2
			}
		default:
			fmt.Fprintln(os.Stderr, "unknown pattern", name)
			os.Exit(2)
		}
	}
	if name == "nearly" {
		x := uint64(12345)
		for k := 0; k < 8; k++ {
			x = xorshift(x)
			i := x % N
			x = xorshift(x)
			j := x % N
			a[i], a[j] = a[j], a[i]
		}
	}
	return a
}

func main() {
	if len(os.Args) != 5 {
		fmt.Fprintln(os.Stderr, "usage: sortref ALGO TYPE PATTERN N")
		os.Exit(2)
	}
	algo, typ, pat := os.Args[1], os.Args[2], os.Args[3]
	n, err := strconv.Atoi(os.Args[4])
	if err != nil {
		panic(err)
	}
	a := pattern(pat, n)
	key := func(x uint64) uint64 { return x }
	if typ == "pair" {
		for i := range a {
			a[i] = (a[i]%(1<<40))<<20 + uint64(i)%(1<<20)
		}
		key = func(x uint64) uint64 { return x >> 20 }
	} else if typ != "nat" {
		fmt.Fprintln(os.Stderr, "unknown type", typ)
		os.Exit(2)
	}
	cmps := 0
	cmp := func(x, y uint64) int {
		cmps++
		kx, ky := key(x), key(y)
		if kx < ky {
			return -1
		} else if kx > ky {
			return 1
		}
		return 0
	}
	t0 := time.Now()
	switch algo {
	case "pdq":
		slices.SortFunc(a, cmp)
	case "stable":
		slices.SortStableFunc(a, cmp)
	default:
		fmt.Fprintln(os.Stderr, "unknown algorithm", algo)
		os.Exit(2)
	}
	ns := time.Since(t0).Nanoseconds()
	h := uint64(0)
	for _, x := range a {
		h = (h ^ x) * 1099511628211
	}
	fmt.Printf("ns=%d hash=%d cmps=%d\n", ns, h, cmps)
}
