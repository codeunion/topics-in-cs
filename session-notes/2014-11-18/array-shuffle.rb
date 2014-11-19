# Write a function to shuffle an array in place.
# All permutations must be equally likely.
# We can use rand(...)

def random_index(len)
  rand(1..len) - 1
end

def swap_index(array, i, j)
  tmp = array[i]
  array[i] = array[j]
  array[j] = tmp
end

def swap_shuffle1(array)
  len = array.length

  len.times do |i|
    swap_index(array, rand(0..len-1), rand(0..len-1))
  end

  array
end

def swap_shuffle2(array)
  len = array.length

  len.times do |i|
    swap_index(array, i, rand(0..len-1))
  end

  array
end

def swap_shuffle3(array)
  len = array.length

  len.times do |i|
    swap_index(array, i, rand(i..len-1))
  end

  array
end

def count_entries(data)
  data.inject(Hash.new(0)) do |results, entry|
    results[entry] += 1/data.length.to_f
    results
  end
end
