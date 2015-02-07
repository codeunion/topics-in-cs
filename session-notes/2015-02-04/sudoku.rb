# 1. Make the Sudoku boards immutable
# 2. Referential transparency

# get_row_values(5,4)
# get_col_values(5,4)
# get_box_values(5,4)

class SudokuBoard
end

# Accepts a SudokuBoard as input
# Returns a solved version of the given Board if
# it exists, otherwise returns nil

def solve(board)
  return board if solved?(board)

  board.children.each do |child|
    
  end
end

# Imagine that board.children returns an Array
# of new SudokuBoard instances, each one having
# the "guessing square" filled in with one
# valid guess

def add(x,y)
  (x + y)
end

add(5, 4)

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

jesse = Person.new("Jesse Farmer")
jesse.name()
jesse.name = "Waffles"
jesse.name()
