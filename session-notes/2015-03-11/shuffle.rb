def shuffle!(list)
  n = list.length

  (n - 1).downto(0) do |i|
    j = rand(0..i)
    list[j], list[i] = list[i], list[j]
  end

  list
end

def shuffle(list)
  shuffle!(list.dup)
end

# Example usage:
#   ruby shuffle.rb 1000 1,2,3,4 | ruby histogram.rb
if __FILE__ == $PROGRAM_NAME
  sample_count = ARGV[0].to_i
  values       = ARGV[1].split(",")

  sample_count.times do
    puts shuffle(values).join("-")
  end
end
