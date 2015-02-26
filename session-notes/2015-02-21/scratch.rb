


cheapest(cell) = min(cheapst(neighbor1) + cost(cell), cheapest(neighbor2) + cost(cell))

cheapest(i,j)

cheapest(10, 10) = min(cheapest(9, 10) + cost(10,10), cheapest(10, 9) + cost(10, 10))


# maximum subarray sum

Given an array of integers, which subarray has the largest sum?
Integers could be positive, could be negative

max([ sum(a[j:i]) for i in range(1, len(a)+1) for j in range(i) ])

def subarray_sum(array, i, j)
  sum(array[i:j])
end

sum(a[2:5]) = sum(a[2:3]) + sum(a[3:5])

biggest(0,1,2,3,4,5)

[1,2,3,4,5,6]
