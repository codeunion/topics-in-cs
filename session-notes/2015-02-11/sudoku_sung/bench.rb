require 'benchmark'

require_relative 'lib/sudoku/solver'

PUZZLE_COUNT = ARGV.fetch(0) { 3 }.to_i
puzzles = File.readlines('unsolved.200.txt').map(&:chomp).first(1)

# puts "Benchmarking #{PUZZLE_COUNT} random Sudoku puzzles..."

Benchmark.bm(6) do |r|
  r.report("sudoku") do
    puzzles.each { |puzzle| Sudoku::Solver.new(puzzle).answer }
  end
end
