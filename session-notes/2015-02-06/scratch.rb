# Write a recursive function for generating all permutations of an input
# string, returning them as an array.

# Accepts a String as input and returns a Set containing all
# the permutations of the input String
def permutations(string)
end

if __FILE__ == $PROGRAM_NAME
  p permutations(["a", "b", "c"]).sort == ["aaa", "aaa", "aaa", "aaa", "aaa", "aaa"]
  p permutations("cat").sort == ["act", "atc", "cat", "cta", "tac", "tca"]
end

def factorial(n, result = 1)
  return result if n == 0
  return factorial(n - 1, result * n)
end

factorial(5, 1)
factorial(4, 1 * 5)
factorial(3, 1 * 5 * 4)
factorial(2, 1 * 5 * 4 * 3)
factorial(1, 1 * 5 * 4 * 3 * 2)
factorial(0, 1 * 5 * 4 * 3 * 2 * 1) # => 1 * 5 * 4 * 3 * 2 * 1


def permutations(array)
  return [array] if array.length == 1

  results = []

  array.each_with_index do |item, i|
    permutations(array[0..i-1] + array[i+1..-1]).each do |perm|
      results << perm.unshift(item)
    end
  end

  results
end

# cats
#   - starts with c
#   - starts with a
#   - starts with t
#   - starts with s

permutations([1]) == [[1]]

[1]
[[1]]

"ca"
[
  "ca",
  "ac"
]

"cat"
[
  "cat", "cta",
  "act", "atc",
  "tca", "tac"
]

"cats"

"c" + all permutation of "ats"
"a" + all permutations of "cts"
"s" + all permutations of "cat"

"t" + all permutations of "cas"
    ("c" * permutations of "as") +
    ("a" * permutations of "cs") +
    ("s" * permutations of "ca")
          "c" + all permutations of "a"
          "a" + all permutations of "c"

["ats", "ast", "tas", "tsa", "sat", "sta"]


"cats"
[
  "cats", "cast", "ctas", "ctsa", "csat", "csta",
  "c" + "ats", "c" + "ast", "c" + "tas", "c" + "tsa", "c" + "sat", "c" + "sta",
  "acts", "acst", "atcs", "atsc", "asct", "astc",
  "tcas", "tcsa", "tacs", "tasc", "tsca", "tsac",
  "scat", "scta", "sact", "satc", "stca", "stac"
]
















# hah
