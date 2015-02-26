require 'matrix'

require_relative 'puzzle'

module Sudoku
  class Solver

    attr_reader :puzzle

    # @param [String]
    def initialize(input)
        rows = [[],[],[],[],[],[],[],[],[]]
        input.strip.split("").each_with_index do |e, index|
          rows[index / 9] << e.to_i
        end

        @puzzle = Sudoku::Puzzle.new(Matrix.rows(rows))
    end

    def answer
      @puzzle.solve.matrix.to_s
    end
  end
end
