require 'pp'

# Get the running time of a block
def time(&block)
  t0 = Time.now
  block.call
  t1 = Time.now

  (t1 - t0).to_f*1000
end

# Get the average running time of N block
def bench(count = 1, &block)
  count.times.map { time(&block) }.reduce(:+) / count.to_f
end

# This is O(n^2)
#   n       # of times called (minus the initial call)
#   1       1
#   2       3
#   3       7
#   4       ~14
#   5       ~28
#           2^n - (something)

# fib(1) is 1 call
# fib(0) is 1 call
# fib(n)  is ~ 2*fib(n-1) calls
# fib(n)  is 2*2*fib(n-2)
# fib(n) is 2^k * fib(n-k) calls

# fib(n) will call fib about 2*fib(n-1) times.
# fib(n+1) will call fib about
#  2*fib(n) times which is about
#  2*2*fib(n-1) times which is about 2^2 * fib(n-1)
#  2*2*2*fib(n-2) times which is about 2^3 * fib(n-2)
#  2*2*2*2*fib(n-3) times which is about 2^4 * fib(n-3)
#  2*2*2*2*2*fib(n-4) times              2^5 * fib(n-4)
#  and so on until we hit one of the base cases
#  2*2*2*2*2*2*2*2..............................*2 +/- (a 1 here or there)

# f(x) is _eventually_ bounded above by _some_ constant multiple of 2^x
#
#   f(x) = 2^x + x is O(2^x)
#
#   2^x + x     2^x    x     |      x  |
#   -------   = --- + ___  = | 1 + --- | -----> goes to 1 as x goes to infinity
#     2^x       2^x   2^x    |     2^x |


#  x      1
# ---  =  -  ----> goes to 0 as x goes to infinity
# x^2     x

# 3x^2 + x          x          1
# ---------  = 3 + ---  = 3 + --- ----> goes to 3 as x goes to infinity
#  x^2             x^2         x

# f(x) = 3^2 + x then f is O(x^2)

# This means that x grows at a "lower order of magnitude" than x^2
# Or that x^2 is a "strictly larger" complexity class than x

#  5/(2*2*2*2*2)
#  6/(2*2*2*2*2*2)
#  7/(2*2*2*2*2*2*2)

# This is O(2^n), NOT O(n^2)
def fib_naive(n)
  return 0 if n == 0
  return 1 if n == 1
  return fib_naive(n-1) + fib_naive(n-2)
end

# calls(n) = 2*calls(n-1)
#          = .....*calls(1)

#      f
#    /   \
#   f     f
#  / \   / \
# f   f f   f

# This is O(n)
def fib_linear(n)
  a, b = 0,1

  n.times do
    a, b = b, a + b
  end

  a
end

require 'matrix'

# log(n^n) = n*log(n)
# log(n^2) = 2*log(n)
# log(x^y) = y*log(x)

# logs take multiplication to addition
# log(n^n) = n*log(n)
#  = log(n * ..... * n) (n times)
#  = log(n) + ..... + log(n) (n times)
#  = n*log(n)

# log(a*b*c*d) = log(a) + log(b) + log(c) + log(d)
# exponentation takes addition to multiplication
# exp(a+b+c+d) = exp(a)*exp(b)*exp(c)*exp(d)

FIB_MATRIX = Matrix[[1,1],[1,0]]
# O(log n)
def fib_matrix(n)
  (FIB_MATRIX**(n-1))[0,0]
end

if $0 == __FILE__
  max_input = ARGV.fetch(0) { 100 }.to_i
  step_size = ARGV.fetch(1) { 1 }.to_i

  report = {}

  report[:fib_linear] = (0..max_input).step(step_size).inject({}) do |data, n|
    data.update n => bench(5) { fib_linear(n) }
  end

  report[:fib_matrix] = (0..max_input).step(step_size).inject({}) do |data, n|
    data.update n => bench(5) { fib_matrix(n) }
  end

  PP.pp report
end
