require 'set'

module Sudoku
  class Puzzle

    attr_reader :matrix, :children

    # @param [Matrix] matrix
    def initialize(matrix)
      @matrix = matrix
      @children = build_children
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
    def build_children
      children = []
      row, col = @matrix.index(0, :all)
      if row && col
        all_possibilities = Set.new([1,2,3,4,5,6,7,8,9]).subtract(set_for_row(row) + set_for_col(col) + set_for_square(matrix_index_to_array_index([row, col])))
        # what if the puzzle is complete????
        # what if there are no possibilities
        all_possibilities.each do |possibility|
          #matrices are immutable
          new_matrix_rows = @matrix.to_a
          new_matrix_rows[row][col] = possibility
          new_matrix = Matrix.rows(new_matrix_rows)
          children << Puzzle.new(new_matrix)
        end
      end

      children
    end

    # @param [Integer] row_index
    # @return [Set]
    def set_for_row(row_index)
      Set.new(@matrix.row(row_index))
    end

    # @param [Integer] col_index
    # @return [Set]
    def set_for_col(col_index)
      Set.new(@matrix.column(col_index))
    end

    # @param [Integer] array_index
    # @return [Set]
    def set_for_square(array_index)
      Set.new(array_index_to_matrix_subsquare(array_index).to_a.flatten)
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

