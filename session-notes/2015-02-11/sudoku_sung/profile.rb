require 'rblineprof'

require_relative 'lib/sudoku/solver'

puzzle = File.readlines('unsolved.200.txt').first.chomp

profile = lineprof(/./) do
  Sudoku::Solver.new(puzzle).answer
end

file = RUBY_VERSION > '1.9' ? File.expand_path(__FILE__) : __FILE__
allocation_mode = false

File.readlines(file).each_with_index do |line, num|
  wall, cpu, calls, allocations = profile[file][num+1]

  if allocation_mode
    if allocations > 0
      printf "% 10d objs | %s", allocations, line
    else
      printf "                | %s", line
    end

    next
  end

  if calls && calls > 0
    printf "% 8.1fms + % 8.1fms (% 5d) | %s", cpu/1000.0, (wall-cpu)/1000.0, calls, line
    # printf "% 8.1fms (% 5d) | %s", wall/1000.0, calls, line
  else
    printf "                                | %s", line
    # printf "                   | %s", line
  end
end

puts
profile.each do |file, data|
  total, child, exclusive, allocations = data[0]
  puts file
  printf "  % 10.1fms in this file\n", exclusive/1000.0
  printf "  % 10.1fms in this file + children\n", total/1000.0
  printf "  % 10.1fms in children\n", child/1000.0
  puts
end
