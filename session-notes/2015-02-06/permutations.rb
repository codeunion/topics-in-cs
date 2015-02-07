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
