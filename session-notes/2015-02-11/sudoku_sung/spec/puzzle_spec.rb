require 'matrix'
require_relative '../lib/sudoku/puzzle'

describe Sudoku::Puzzle do
  let(:matrix) {Matrix.rows([[0,2,0,8,4,0,0,9,7],
                          [3,0,0,0,0,0,0,5,0],
                          [0,0,7,0,2,0,1,0,0],
                          [9,0,8,2,0,0,3,0,0],
                          [1,0,0,0,0,0,0,0,9],
                          [0,0,6,0,0,4,7,0,8],
                          [0,0,5,0,7,0,2,0,0],
                          [0,1,0,0,0,0,0,0,5],
                          [4,6,0,0,8,2,0,7,0]])}
  let(:solution_matrix) {Matrix.rows([[5, 2, 1, 8, 4, 3, 6, 9, 7],
                                [3, 8, 9, 6, 1, 7, 4, 5, 2],
                                [6, 4, 7, 9, 2, 5, 1, 8, 3],
                                [9, 7, 8, 2, 5, 1, 3, 4, 6],
                                [1, 3, 4, 7, 6, 8, 5, 2, 9],
                                [2, 5, 6, 3, 9, 4, 7, 1, 8],
                                [8, 9, 5, 1, 7, 6, 2, 3, 4],
                                [7, 1, 2, 4, 3, 9, 8, 6, 5],
                                [4, 6, 3, 5, 8, 2, 9, 7, 1]])}
  let(:puzzle) {Sudoku::Puzzle.new(matrix)}

  it "#build_children" do
    expect(puzzle.children.empty?).to eq(false)
  end

  it "#solved?" do
    expect(puzzle.solved?).to eq(false)
  end

    it "#impossible?" do
    expect(puzzle.impossible?).to eq(false)
  end

  it "#possible?" do
    expect(puzzle.possible?).to eq(true)
  end

  it "solves unsolved sudoku puzzles" do
    solved_puzzle_matrix = puzzle.solve.matrix
    expect(solved_puzzle_matrix).to eq(solution_matrix)
  end
end
