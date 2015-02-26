# Session Notes: Topics in CS
## Friday, February 13, 2015

## Big-O Notation

### The Problem

Question: what do we mean when we say one algorithm "performs" better
(or worse) than another?

Can we come up with a way to compare the (cpu, memory) efficiency of two
algorithms in a way that doesn't depend on the physical implementation or
execution context?


### Exponential Functions

f(n) ~ O(g(n))

f(n) ~ C*g(n)

O(1)

f(n) ~ C*1 ~ C

exp(m + n) = exp(m) * exp(n)

Running time for input x + 3 = (Running time for input x) * 1.616 * 1.616 *  1.616

Running time for input N = C * (a^N) ~ O(2^n)

2^(5+4) = (2^5) * (2^4)

f(x+1) = a*2^(x+1)
       = f(x) * 2


f(x) = a*exp(b*x)

f(0) = a*exp(b*0) = a*exp(0) = a*1 = a
f(x + 1) = a*exp(b*(x + 1))
         = a*exp(b*x + b)
         = a*exp(b*x)*exp(b)
         = f(x) * exp(b)
