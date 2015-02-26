require_relative '../../lib/sudoku/solver'

describe Sudoku::Solver do
  it "solves unsolved sudoku puzzles" do
    puzzle_one = "020840097300000050007020100908200300100000009006004708005070200010000005460082070"
    solution_one =  [5, 2, 1, 8, 4, 3, 6, 9, 7, 3, 8, 9, 6, 1, 7, 4, 5, 2, 6, 4, 7, 9, 2, 5, 1, 8, 3, 9, 7, 8, 2, 5, 1, 3, 4, 6, 1, 3, 4, 7, 6, 8, 5, 2, 9, 2, 5, 6, 3, 9, 4, 7, 1, 8, 8, 9, 5, 1, 7, 6, 2, 3, 4, 7, 1, 2, 4, 3, 9, 8, 6, 5, 4, 6, 3, 5, 8, 2, 9, 7, 1]
    solver_one = Sudoku::Solver.new(puzzle_one)
    expect(solver_one.answer).to eq(solution_one)
  end
end
