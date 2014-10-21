# Write a method to calculate x^n, where n is a positive integer
# Without using Ruby's built-in ** operator.

# What's the Big-O of this (time-wise)?
# What's the Big-O of this (memory-wise)?
# This is O(n) in time and O(1) in memory
# Or: linear in time and constant in memory
def pow(x,n)
  result = 1

  n.times do
    result *= x
  end

  result
end
# Where p is N things long or N units big or whatever
# solve(p) = combine(solve(p/2), solve(p/2))
# solve(p) = combine(
#                 combine(solve(p/4), solve(p/4)),
#                 combine(solve(p/4), solve(p/4))
#            )
# _IF_ we can do this, then the total cost of our algorithm will be
# cost(combine) * number of times we combined it
# = cost(combine) * log(N)

# sort([n])  = [n]
# sort(list) = merge(sort(list[0..length/2]), sort(list[length/2..length]))
# cost(sort(list)) = cost(merge) * log(length(list))

# <n n <op>> <expr2> <op>
# n n <op>
# n <expr> <op>
# <expr> n <op>
# 2^n = doubling the work each time
# log(n) results from halving the work
# x^4 = (x*x)*(x*x)
# x^4 = x^2 * x^2
# x^20 = (x^10) * ((x * x) * x^2)*x * x^5)
# x*x -> z
# z * z
