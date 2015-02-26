require 'matrix'

require_relative '../n_tree'
require_relative '../doubly_linked_list'

module Sudoku

  class Puzzle
    include NTree
    include DoublyLinkedList

    @@ROWS = [(0..8),
              (9..17),
              (18..26),
              (27..35),
              (36..44),
              (45..53),
              (54..62),
              (63..71),
              (72..80)]

    attr_accessor :parent, :children, :next, :prev
    attr_reader :head, :tail, :last_sibling
    # @param [Array<Integer>] blocks
    # @param [Puzzle] parent
    # @param [Puzzle] children
    # @param [Puzzle] nxt
    # @param [Puzzle] prev
    # @param [Puzzle] head
    # @param [Puzzle] tail
    def initialize(blocks, parent = nil, children = nil, nxt = nil, prev = nil, head = nil, tail = nil)
      @first_array_index = first_array_index_of(blocks)                     # Integer or nil
      @last_sibling     = set_last_sibling(blocks, @first_array_index)      # Boolean
      @current_blocks   = build_current_blocks(blocks, @first_array_index)  # ex. [0, 2, 0, 8, 4, 0, 0, 9, 7, 3, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 7, 0, 2, 0, 1, 0, 0, 9, 0, 8, 2, 0, 0, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 6, 0, 0, 4, 7, 0, 8, 0, 0, 5, 0, 7, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 5, 4, 6, 0, 0, 8, 2, 0, 7, 0]
      @blocks           = format_blocks(blocks, @first_array_index)         #arrays
                                                                            # ex. [[1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 4, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, 7, 3, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], 1, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 3, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 1, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 9, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 6, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 4, 7, [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, [1, 2, 3, 4, 5, 6, 7, 8, 9], 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 1, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 5, 4, 6, [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], 8, 2, [1, 2, 3, 4, 5, 6, 7, 8, 9], 7, [1, 2, 3, 4, 5, 6, 7, 8, 9]]
      @puzzle           = build_puzzle                                      # Matrix
      @parent           = parent                                            
      @children         = children
      @next             = nxt
      @prev             = prev
      @head             = head #head of children
      @tail             = tail #tail of children
    end

    def solve
      # TODO
      #update build_puzzle tool

      # start from most concrete base, end case: solved
      if solved?
        return @puzzle
      elsif impossible?
        # TODO
        if last_sibling?
          @parent.append_sibling(Puzzle.new(@blocks, @parent.parent))
          @parent.next.solve
        else
          append_sibling(Puzzle.new(@blocks, @parent))
          @next.solve
        end
      else #possible
        if can_go_deeper? #depth first
          append_child(Puzzle.new(@blocks, self))
          @head.solve
        else
          append_sibling(Puzzle.new(@blocks, @parent))
          @next.solve
        end
      end
    end

    # @return [String]
    def to_s
      # TODO
    end

    def to_a
      @current_blocks
    end

    # @return [Boolean]
    def solved?
      complete? && !impossible?
      #no empty blocks, i.e. zeros
      #not impossible
    end

    # @runtime linear # Is this still linear since we max of n is 57? It's not quite constant.
    # @runtime BigO(n)
    # @runtime Theta(6n1 + n2) # 2n1 + 2n1 + 2n1 + n2 = 54 + 3 = 57
    #   where n1 = elements in a row, column, or minor = 9 
    #   and n2 = number of rows in a minor = 3
    # @return [Boolean]
    def impossible?
      @blocks.each_index do |block_index|
        puzzle_index = block_index_to_puzzle_index(block_index)
        row_index, column_index = puzzle_index
        if  impossible_row?(row_index) ||
            impossible_column?(column_index) ||
            impossible_square?(block_index)

          return true # return breaks loop
        end
      end

      return false
    end

    def last_sibling?
      @last_sibling
    end

    def can_go_deeper?
      !complete?
    end

    def append_child(child)
      append(child)
    end

    def prepend_child(child)
      prepend(child)
    end

    def append_sibling(sibling)
      if @parent
        @parent.append(sibling)
      else
        @next = sibling
        sibling.prev = self
      end
    end

    def prepend_sibling(sibling)
      if @parent
        @parent.prepend(sibling)
      else
        @prev = sibling
        sibling.next = self
      end
    end

    private
    # @runtime linear up to a max n of 81
    # @runtime BigO(1) constant
    def first_array_index_of(blocks)
      blocks.each_index do |index|
        return index if blocks[index].is_a?(Array)
        return nil if index == 80
      end
    end

    private
    def set_last_sibling(blocks, first_array_index)
      first_array_index && blocks[first_array_index].length == 1
    end

    private
    def build_current_blocks(blocks, first_array_index)
      # current_blocks = blocks.dup
      current_blocks = blocks
      if first_array_index
        if blocks[first_array_index].length == 1
          current_blocks[first_array_index] = current_blocks[first_array_index][0]
          @last_sibling = true
        else
          current_blocks[first_array_index] = current_blocks[first_array_index].pop
        end
      end

      return current_blocks.map { |e| 0 if e.is_a?(Array)}
    end

    private
    def format_blocks(blocks, first_array_index)
      if first_array_index
        if blocks[first_array_index].length == 1
          blocks[first_array_index] = blocks[first_array_index][0]
          @last_sibling = true
        else
          blocks[first_array_index].pop
        end
      end

      return blocks
    end

    private
    # @runtime linear
    # @return [Matrix]
    def build_puzzle
      rows = @@ROWS.inject([]) { |rows, range| rows << @current_blocks[range] }
      Matrix.rows(rows)
    end

    private
    # @param [Integer] block_index
    # @return [Array<Integer, Integer>]
    def block_index_to_puzzle_index(block_index)
      [(block_index / 9), (block_index % 9)]
    end

    private
    # @param [Integer] block_index
    # @return [Matrix]
    def block_index_to_puzzle_minor(block_index)
      # [0,0] to [2,2] [0,3] to [0,6] [0,6] to [2,8]
      # [3,0] to [4,2] [3,3] to [3,6] [3,6] to [3,8]
      # [6,0] to [8,2] [6,3] to [6,6] [6,6] to [8,8]
      puzzle_index = block_index_to_puzzle_index(block_index)
      start_row, start_col = [((puzzle_index[0] / 3) * 3), ((puzzle_index[1] / 3) * 3)]
      @puzzle.minor(start_row, 3, start_col, 3)
    end

    private
    # @runtime constant
    # @runtime BigO(1)
    # @runtime T(2)
    # @return [Boolean]
    def complete?
      # @blocks.each { |e| return false if e.is_a?(Array) }
      # Probaly simpler to use: @first_array_index == nil or 80
      # @current_blocks.each { |e| return false if e == 0 }

      !@first_array_index || @first_array_index == 80

      # return true
      #no empty blocks, i.e. zeros
    end

    private
    # @runtime linear up to a max n of 18
    # @runtime BigO(1)
    # @runtime T(2n)
    # @return [Boolean]
    def impossible_row?(row_index)
      @puzzle.row(row_index).group_by { |e| e}.length < 9
    end

    private
    # @runtime linear up to max n of 18
    # @runtime BigO(1)
    # @runtime T(2n)
    # @return [Boolean]
    def impossible_column?(column_index)
      @puzzle.column(column_index).group_by { |e| e }.length < 9
    end

    private
    # @runtime linear up to a max of 21
    # @runtime BigO(1)
    # @runtime T(n1 + 2n2)
    #   where n1 is the number of rows in puzzle minor (3)
    #   and n2 is size of elements in puzzle minor (9)
    # @return [Boolean]
    def impossible_square?(block_index)
      block_index_to_puzzle_minor(block_index)
        .to_a
        .flatten
        .group_by { |e| e }
        .each { |e| return true if e.size > 1 }

      return false
    end

  end
 
end
