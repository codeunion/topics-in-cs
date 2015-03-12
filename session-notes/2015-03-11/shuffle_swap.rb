def shuffle_swap(list)
  n = list.length

  n.times do
    i, j = rand(0...n), rand(0...n)
    list[j], list[i] = list[i], list[j]
  end

  list
end

if __FILE__ == $PROGRAM_NAME
  sample_count = ARGV[0].to_i
  values       = ARGV[1].split(",")

  sample_count.times do
    puts shuffle_swap(values.dup).join("-")
  end
end
