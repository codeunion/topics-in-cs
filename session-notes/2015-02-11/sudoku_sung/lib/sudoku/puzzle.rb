require 'set'

module Sudoku
  class Puzzle

    ALL_VALUES = Set.new([1,2,3,4,5,6,7,8,9]).freeze

    attr_reader :matrix

    # @param [Matrix] matrix
    def initialize(matrix)
      @matrix = matrix

      @pivot_row, @pivot_col = @matrix.index(0, :all)
    end

    # @return [Sudoku::Puzzle]
    def solve
      return self if solved?

      children.each do |child|
        solution = child.solve # self or nil
        return solution if solution #break the loop if solution found
      end

      return nil #if impossible # place this return at the end to prevent premature breaking of the loop
                                # within the children
    end

    # @return [Boolean]
    def solved?
      !@matrix.index(0, :all)
    end

    # @return [Boolean]
    def impossible?
      !solved? && children.empty?
    end

    # @return [Boolean]
    def possible?
      !solved? && !children.empty?
    end

    private
    # @return [Array<Sudoku::Puzzle>]
    def children
      return [] unless @pivot_row && @pivot_col
      all_possibilities = ALL_VALUES - (set_for_row(@pivot_row) + set_for_col(@pivot_col) + set_for_square(matrix_index_to_array_index([@pivot_row, @pivot_col])))

      all_possibilities.map do |possibility|
        new_matrix_rows = @matrix.to_a
        new_matrix_rows[@pivot_row][@pivot_col] = possibility
        new_matrix = Matrix.rows(new_matrix_rows)
        Puzzle.new(new_matrix)
      end
    end

    # @param [Integer] row_index
    # @return [Set]
    def set_for_row(row_index)
      @set_for_row ||= Set.new(@matrix.row(row_index))
    end

    # @param [Integer] col_index
    # @return [Set]
    def set_for_col(col_index)
      @set_for_col ||= Set.new(@matrix.column(col_index))
    end

    # @param [Integer] array_index
    # @return [Set]
    def set_for_square(array_index)
      @set_for_square ||= Set.new(array_index_to_matrix_subsquare(array_index).to_a.flatten)
    end

    # @runtime constant
    # @param [Integer] array_index
    # @return [Array<Integer, Integer>]
    def array_index_to_matrix_index(array_index)
      [(array_index / 9), (array_index % 9)]
    end

    # @runtime constant
    # @param [Array<Integer>] matrix_index
    # @return [Integer]
    def matrix_index_to_array_index(matrix_index)
      row, col = matrix_index
      row * 9 + col
    end

    # @runtime constant
    # @param [Integer] array_index
    # @return [Matrix]
    def array_index_to_matrix_subsquare(array_index)
      # [0,0] to [2,2] [0,3] to [0,6] [0,6] to [2,8]
      # [3,0] to [4,2] [3,3] to [3,6] [3,6] to [3,8]
      # [6,0] to [8,2] [6,3] to [6,6] [6,6] to [8,8]
      matrix_index = array_index_to_matrix_index(array_index)
      start_row, start_col = [((matrix_index[0] / 3) * 3), ((matrix_index[1] / 3) * 3)]
      @matrix.minor(start_row, 3, start_col, 3)
    end

  end
end
