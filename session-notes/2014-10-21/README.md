# October 21, 2014

## Big-O Notation

Big-O notation is a way of describing the complexity of an algorithm.  It describes how many more steps an algorithm needs to take when an input is 1 larger.

Big-O notation is used to measure the execution time of a program, e.g., how many steps it takes to run a program.

It's a way to evaluate how a function will perform based on given on a number of inputs.


f(x) is some function.  g(x) is some function we care about.

O(g) describes a set (or class or collection, etc) of functions.  It's not a single function, but a big family of functions defined by their relationship to g(x).  O(g) is a set of functions related to g in a specific way.

We say f is O(g) — read "f is Big-O of g" — if f is _eventually_ bounded above by _some_ constant multiple of g.  The "eventual" part is there to handle things like fixed costs, variability in execution, and so on.  The "constant multiple" part is there to deal with machine or implementation-specific costs (variable costs).

f is O(x^2) that means: _eventually_ f is bounded above by _some_ constant multiple of x^2.

Or: eventually, f(x) <= C*x^2.

OR: there exists some z and C such that for all x > z, f(x) <= C*x^2.

"log"

The log function is the inverse of the exponential function.  That means that log(exp(x)) = x for all x.

BUT

In math, "log" means the logarithm in base "e" (sometimes called the natural logarithm and written "ln").

In computer science, "log" means the logarithm in base "2".

In other places, "log" means the logarithm in base 10.

O(log n) — they mean log of base 2

log(10^x) = x
log(2^x)  = x
log(e^x)  = x

A ⊆ B, this means "A is a subset of B", i.e., everything in A is also in B.  For example, the set of even integers is a subset of the set of _all_ integers.

O(1) ⊆ O(log n) ⊆ O(n)   ⊆ O(n^2)
     ⊆ O(n^3)   ⊆ O(2^n) ⊆ O(n!) ⊆ O(n^n)

x^2
----   =  x  ---> infinity as x gets larger
x


n^n = n *   n   * ... * n * n
      -----------------------
n!  = n * (n-1) * ... * 2 * 1

```
total_cost(input)
  = fixed_cost(input) +
    variable_cost(input) * steps(input)
```
