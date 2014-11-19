# Write a function to reverse an array in place.

# O(n) in time
# O(1) in space

# O(n) in time
# O(1) in space
def reverse_array(array)
  i = 0
  j = array.length - 1

  while i < j
    temp = array[j]
    array[j] = array[i]
    array[i] = temp

    i += 1
    j -= 1
  end

  array
end
