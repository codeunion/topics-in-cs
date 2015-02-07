# 1. The base case (how we know then to stop dividing the problem)
# 2. A way to break the problem down into smaller, identical problems
# 3. A way to combine the smaller solutions into the larger solution

def permutations(array)
  return [array] if array.length == 1

  array.each_with_index.flat_map do |item, i|
    permutations(array[0...i] + array[i+1..-1]).map do |perm|
      [item] + perm
    end
  end
end

# def reverse(array)
#   result = []
#
#   (array.length - 1).downto(0) do |i|
#     result << array[i]
#   end
#
#   result
# end

def reverse(array)
  return [] if array == []

  first, *rest = array

  reverse(rest) + [first]
end

def each(array, &block)
  return if array.empty?

  first, *rest = array
  block.call(first)
  rest.each(&block)
end

def map(array, &block)
end

def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  return fib(n-1) + fib(n-2)
end

def fib_iter(n)
  return 0 if n == 0
  return 1 if n == 1

  fibs = [0,1]

  2.upto(n) do |i|
    old_fib  = fibs[1]
    new_fib  = fibs[1] + fibs[0]

    fibs  = [old_fib, new_fib]
  end

  fibs[1]
end

def sum(array)
  return 0 if array.empty?

  first, *rest = array

  first + sum(rest)
end

def sum(array)
  inject(array, 0) { |memo, item| memo + item }
end

def all?(array, &block)
  inject(array, true) { |memo, item| memo && block.call(item) }
end

def any?(array, &block)
  inject(array, false) { |memo, item| memo || block.call(item) }
end

def map(array, &block)
  inject(array, []) { |memo, item| memo + [block.call(item)] }
end

def inject(array, memo, &block)
  return memo if array.empty?

  first, *rest = array

  inject(rest, block.call(memo, first), &block)
end

# def map(array, function)
# end
#
# def map(function, map)
# end
#
# def inject(function, list, initial)
# end
#
# array.map { |n| n**2 }
# square_all = map({ |n| n**2 })
# square_all([1,2,3]) # => [1,4,9]


# Binary search
# [1, 17, 89, 104, 76545]
# log2(1000000)

# 1. The base case (how we know then to stop dividing the problem)
# 2. A way to break the problem down into smaller, identical problems
# 3. A way to combine the smaller solutions into the larger solution

def merge_sort(array)
  return array if array.length == 1
  left  = merge_sort(left_half(array))
  right = merge_sort(right_half(array))
  return merge(left, right)
end

# Sorting
# [120, 304, 225, 224, 313] => [120, 224, 225, 304, 313]
# [251, 274, 288, 297, 374] => [251, 274, 288, 297, 374]

# []
# []
# [120, 224, 225, 251, 274, 288, 297, 304, 313, 374]
