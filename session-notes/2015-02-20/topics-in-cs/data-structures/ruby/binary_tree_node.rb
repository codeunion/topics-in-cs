# tree = BinaryTree(
#   8,
#   BinaryTree(
#     3,
#     BinaryTree(1),
#     BinaryTree(6)
#   ),
#   BinaryTree(10)
# )


def BinaryTree(*args)
  BinaryTree.build(*args)
end

class BinaryTree
  include Enumerable
  attr_accessor :value, :left, :right

  def self.build(value = :empty, left = :empty, right = :empty)
    case value
    when BinaryTree
      value
    when :empty
      BinaryTree.empty
    else
      BinaryTree.new(value, left, right)
    end
  end

  def self.empty
    @_empty ||= EmptyTree.new
  end

  def initialize(value, left = :empty, right = :empty)
    @value = value
    @left  = BinaryTree.build(left)
    @right = BinaryTree.build(right)
  end

  # @return [Array<BinaryTree::Node>]
  def children
    [@left, @right]
  end

  def each(&block)
    pre_order(&block)
  end

  # Implement pre-order traversal of the tree
  def pre_order(&block)
    block.call(self.value)
    left.pre_order(&block)
    right.pre_order(&block)
  end

  # Implement in-order traversal of the tree
  def in_order(&block)
    left.in_order(&block)
    block.call(self.value)
    right.in_order(&block)
  end

  # Implement post-order traversal of the tree
  def post_order(&block)
    left.post_order(&block)
    right.post_order(&block)
    block.call(self.value)
  end

  def empty?
    false
  end

  def size
    1 + left.size + right.size
  end

  def ==(other)
    return false if !other.instance_of?(self.class)
    self.to_a == other.to_a
  end
end

class EmptyTree < BinaryTree
  def initialize(value = :empty, left = self, right = self)
    @value = :empty
    @left  = self
    @right = self
  end

  def pre_order(&block);  end
  def in_order(&block);   end
  def post_order(&block); end

  def empty?
    true
  end

  def size
    0
  end

  def to_s
    "()"
  end

  alias_method :inspect, :to_s
end
