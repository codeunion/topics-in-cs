class TreeNode
  attr_reader :value, :children

  def append_child(value)
    @children << TreeNode.new(value)
  end

  def each(&block)
    block.call(self.value)

    children.each do |child|
      child.each(&block)
    end
  end
end

class SudokuBoard
end

# Accepts a SudokuBoard as input
# Returns a solved version of the given Board if
# it exists, otherwise returns nil

def solve(board)
  return board if already_solved?(board)

  board.children.each do |child|
    solution = solve(child)
    return solution if solution
  end

  # There are no children or no solvable children
  return nil
end


# Returns true if all the squares are filled in
# and false otherwise
def solved?(board)
end

tree = TreeNode.new(
  0,
  [
    TreeNode.new(1, [TreeNode.new(4), TreeNode.new(5)]),
    TreeNode.new(2, [TreeNode.new(6)]),
    TreeNode.new(3)
  ]
)

# Should print 0 1 4 5 2 6 3
tree.each do |val|
  puts val
end
