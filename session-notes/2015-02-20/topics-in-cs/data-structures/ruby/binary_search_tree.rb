# A Binary Search Tree is a binary tree with the
# following extra properties:
#
# 1. Every value in the tree is unique
# 2. The values in the tree are mutually comparable[++]
# 3. For a any node, the values in the left sub-tree are less than
#    that node's value and the values in the right sub-tree are
#    greater than that node's value.
#
# [++] For any two arbitrary values X and Y in the tree,
#      one of the following things is true:
#      X == Y, X < Y, or X > Y

# 1 => 10 => 13 => 52 => 302

# tree = BinarySearchTree(1)
# insert(tree, 0) == BinarySearchTree(1) (or maybe nil)
# tree == BinarySearchTree(1)
# tree == BinarySearchTree(1, BinarySearchTree(0))
tree = BinaryTree(
  8,
  BinaryTree(
    3,
    BinaryTree(1),
    BinaryTree(6)
  ),
  BinaryTree(10)
)

def min(root)
  if empty?(root.left)
    root
  else
    min(root.left)
  end
end

def max(root)
  return ________ if empty?(root)
  
end

def insert(root, value)
  return BinaryTree(value) if empty?(root)
  return self              if value == root.value

  if value < root.value
    root.left = insert(root.left, value)
  elsif value > root.value
    root.right = insert(root.right, value)
  end

  root
end

def empty?(root)
  root.empty?
end


require_relative 'binary_search_tree_node'

class BinarySearchTree

  attr_reader :root, :size

  def initialize
    @root = BinarySearchTreeNode
  end

  # @param [Comparable] key
  # @return [Boolean]
  def include?(key)
    @root.include?(key)
  end

  # @param [Object, Object] key_value
  # @return [BinarySearchTree]
  def insert(key_value)
    # key_value = Array(key_value) #coersion
    @root = @root.insert(key_value)
    self
  end

  # @param [Comparable] key
  # @return [BinarySearchTree]
  def remove(key)
    @root = @root.remove(key)
    self
  end

  # @param [Comparable] key
  def find(key)
    @root.find(key)
  end

  # @return [Integer]
  def size
    # TODO Cache Size
    size?
  end

  # @return [Boolean]
  def empty?
    size == 0
  end

  # @return [Integer]
  def size?
    @root.size?
  end

  # @return [Boolean]
  def sorted?
    @root.sorted?
  end

end
