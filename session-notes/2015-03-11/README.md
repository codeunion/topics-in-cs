# Session Notes: Topics in CS

## Wednesday, March 11, 2015

## Testing Shuffle

Run

```shell-session
$ ruby shuffle.rb 1000 1,2,3 | ruby histogram.rb | sort -r
```

This will generate 1000 samples of the permutations of [1,2,3] using the
shuffling algorithm in `shuffle.rb`, print out a table summarizing the results,
and sort the table.

### Cycle Notation

Permutations!  If we have N distinct objects then any arrangement of those
objects is a permutation.  It's important not to think of the permutation
as the "result" of the rearrangement but the act of rearranging itself.  This
lets us talk about permutations without reference to the specific things we're
rearranging, e.g., the permutation that swaps the first two objects and leaves
the rest untouched.

A _cycle_ is a permutation that acts like a "loop", e.g., 1 goes to 3, 3 goes
to 7, and 7 goes back to 1 again.  The number of objects involved in the loop
is called the _length_ of the cycle.  The `1 -> 3 -> 7 -> 1` permutation above
has a length of 3 since the objects involved are 1, 3, and 7.

Two cycles are called _disjoint_ if they don't permute any of the same objects.
For example, `1 -> 3 -> 7 -> 1` and `2 -> 5 -> 2` are disjoint, but
`1 -> 3 -> 7 -> 1` and `3 -> 7 -> 6 -> 3` are not (they both permute 3 and 7).

A _transposition_ is a cycle of length two, corresponding to a permutation that
swaps those two objects, e.g., `1 -> 3 -> 1`

An _adjacent transposition_ is a transposition where the two objects being
swapped are adjacent to each other, e.g., `4 -> 5 -> 4`.

Here are some relevant facts about permutations using the above notions:

1.  Every permutation can be written as a product of disjoint cycles.  This
    representation is unique up to the ordering of the cycles.
2.  Every permutation can be written as the product of adjacent transpositions.
    This representation is not unique, i.e., there are many ways to write a
    given permutation as a product of adjacent transpositions.

    However, the number of adjacent transpositions in any given representation
    will always have the same _parity_.  That is, for a particular permutation
    there will always be an even (or odd) number of transpositions when we
    write it down like that.

    This means there's a well-defined notion of the
    [parity of a permutation](http://en.wikipedia.org/wiki/Parity_of_a_permutation).

### Notes from Session

Call the permutation "perm"

"perm" is some permutation of 10 letters

perm(perm(perm(perm(...perm(x))))) -> x (for any letter x)

There exists some positive integer N such that

(perm∘perm∘perm∘...∘perm) = I
-------- N times --------

I(x) -> x for all x (is how it's define)

Possible values: {A, B, C, D, E}

perm(A) == B
perm(B) == A
perm(C) == E
perm(D) == D
perm(E) == C

Let's say we're permuting {val_1, val_2, val_3, ..., val_N}
for some positive integer N.

Let's say we're permuting {1, 2, 3, 4, 5}

perm(1) = 2
perm(2) = 3
perm(3) = 4
perm(5) = 1

Cycle notation:
(1 2 3 4 5) represents the same permutation as above

{1, 2, 3, 4, 5}
perm1 = (1 2)
perm2 = (4 5)

(1 2 3)(4 5)(1 2 3)(4 5)(1 2 3)(4 5)(1 2 3)(4 5)

((1 2 3) ∘ (4 5))**k == (1 2 3)**k ∘ (4 5)**k

(1 2 3)**3 ∘ (1 2 3)**3 ∘ (4 5)**3

The fundamental theorem of cycle notation:

Every permutation can be written as a sequence of disjoint cycles


Second fact:

Every permutation can be written as a product of (not necessarily disjoint)
transpositions (or "swaps")

1 -> 2
2 -> 3
3 -> 1

(1 2 3)
(1 2)(2 3)   (numbers move from right to left)

g(1) -> 1
g(2) -> 3
g(3) -> 2

f(1) -> 2
f(2) -> 1
f(3) -> 3

f(g(3)) -> f(2) -> 1

(f∘g)(x) := f(g(x))








1-2-3	185220	18.5220%

2-1-3	173029	17.3029%
(1 2)

1-3-2	172739	17.2739%
(2 3)

3-2-1	172616	17.2616%
(1 3)

2-3-1	148363	14.8363%
(1 3 2) = (1 2)(1 3)

3-1-2	148033	14.8033%
(1 2 3) = (1 2)(2 3)
