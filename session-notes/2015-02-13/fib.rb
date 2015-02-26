f(n) = n + 1
g(n) = n

f(n) / g(n) = (n + 1)/n = 1 + 1/n

f(n) = n
g(n) = 2*n

f(n) / g(n) = n/(2n) = 1/2

f(n) = g(n) for all n


def bench
  t1 = Time.now
  yield
  t2 = Time.now

  t2 - t1
end


# fib(4)
#
# fib(2) + fib(3)
#
# (fib(0) + fib(1)) + (fib(1) + fib(2))
#
# (fib(0) + fib(1)) + (fib(1) + (fib(0) + fib(1)))
#
# ((0 + 1)) + (1 + (0 + 1))

# Old one was:
# In time: O(2^n)
# In memory: O(1)

# In time: O(n)
# In memory: O(n)
def fib_recursive(n, cache = {})
  return 0 if n == 0
  return 1 if n == 1

  return cache[n] if cache.key?(n)

  cache[n] = fib_recursive(n - 2, cache) + fib_recursive(n - 1, cache)
end

# In time: O(n)
# In memory: O(n)
def fib(n)
  return 0 if n == 0
  return 1 if n == 1

  fibs = [0,1]

  2.upto(n) do |i|
    fibs << fibs[-2] + fibs[-1]
  end

  fibs[-1]
end

# In time: O(n)
# In memory: O(1)
def fib_iterative(n)
  return 0 if n == 0
  return 1 if n == 1

  a, b = 0, 1

  2.upto(n) do |i|
    a, b = b, a + b
  end

  b
end
