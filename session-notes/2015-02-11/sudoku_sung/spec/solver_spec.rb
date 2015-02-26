require 'matrix'
require_relative '../lib/sudoku/solver'

describe Sudoku::Solver do

  let(:string) { "020840097300000050007020100908200300100000009006004708005070200010000005460082070" }
  let(:matrix) { Matrix.rows([[0,2,0,8,4,0,0,9,7],
                          [3,0,0,0,0,0,0,5,0],
                          [0,0,7,0,2,0,1,0,0],
                          [9,0,8,2,0,0,3,0,0],
                          [1,0,0,0,0,0,0,0,9],
                          [0,0,6,0,0,4,7,0,8],
                          [0,0,5,0,7,0,2,0,0],
                          [0,1,0,0,0,0,0,0,5],
                          [4,6,0,0,8,2,0,7,0]]) }
  let(:solution_matrix) { Matrix.rows([[5, 2, 1, 8, 4, 3, 6, 9, 7],
                                [3, 8, 9, 6, 1, 7, 4, 5, 2],
                                [6, 4, 7, 9, 2, 5, 1, 8, 3],
                                [9, 7, 8, 2, 5, 1, 3, 4, 6],
                                [1, 3, 4, 7, 6, 8, 5, 2, 9],
                                [2, 5, 6, 3, 9, 4, 7, 1, 8],
                                [8, 9, 5, 1, 7, 6, 2, 3, 4],
                                [7, 1, 2, 4, 3, 9, 8, 6, 5],
                                [4, 6, 3, 5, 8, 2, 9, 7, 1]]) }
  let(:solver) { Sudoku::Solver.new(string) }

  it "#initialize" do
    expect(solver.puzzle.matrix).to eq(matrix)
  end
  it "#answer returns string version of solved puzzle matrix" do
    expect(solver.answer).to eq(solution_matrix.to_s)
  end
end
