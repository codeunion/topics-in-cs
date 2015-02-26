require_relative 'binary_tree_node'

# def BinarySearchTreeNode(value, left = nil, right = nil, parent = nil)
#   case value
#   when BinarySearchTreeNode
#     value
#   else
#     BinarySearchTreeNode.new(value, left, right, parent)
#   end
# end

# Implement a binary search tree.
# See http://en.wikipedia.org/wiki/Binary_search_tree
# Operations to support:
#   include?(value)     Average O(log n) time
#   insert(value)       Average O(log n) time
#   remove(value)       Average O(log n) time
#   empty?              O(1) time


class BinarySearchTreeNode < BinaryTreeNode

############################################################
# Class Methods
############################################################
  def self.insert(value)
    BinarySearchTreeNode.new(value)
  end

  def self.insert_subtree(subtree)
    subtree
  end

  def self.remove(value)
    self
  end

  def self.include?(value)
    false
  end

  # def self.remove(key)
  #   self
  # end

  # def self.include?(key)
  #   false
  # end

  # def self.find(key)
  #   nil
  # end

  def self.size?(memo = 0)
    memo
  end

  def self.sorted?
    true
  end

  def self.value
    0
  end

############################################################
# Instance Methods
############################################################

  attr_reader :key

  def initialize(value, opts = {})
    # value = Array(value) #coersion
    opts[:left]  ||= BinarySearchTreeNode
    opts[:right] ||= BinarySearchTreeNode
    # @key = value[0]
    super(value, opts)
  end

  # def key_value
  #   @value[1]
  # end

  # def key_value_pair
  #   @value
  # end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  def include?(value)
    return true if self.value == value
    in_left  = left.include?(value)  if self.value > value
    in_right = right.include?(value) if self.value < value
    (in_left || in_right) ? true : false
  end

  # def include?(key)
  #   return true if @key == key
  #   in_left  = left.include?(key)  if @key > key
  #   in_right = right.include?(key) if @key < key
  #   (in_left || in_right) ? true : false
  # end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  # @param [Comparable] value
  def insert(value)
    # NOTE: TODO What if they are == ? Nothing? Or overwrite? Overwrite. key_value
    dup = self.dup
    return dup if value == @value
    if value < @value
      dup.left = @left.dup.insert(value)
    else
      dup.right = @right.dup.insert(value)
    end

    dup
  end

  # def insert(key_value)
  #   # NOTE: TODO What if they are == ? Nothing? Or overwrite? Overwrite. key_value
  #   dup = self.dup
  #   return dup if @key == key
  #   if @key < key
  #     dup.left = @left.dup.insert(key_value)
  #   else
  #     dup.right = @right.dup.insert(key_value)
  #   end

  #   dup
  # end

  def insert_subtree(subtree)
    new_tree = self.dup
    subtree.each do |key_value|
      new_tree = new_tree.insert(key_value)
    end

    new_tree
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  def remove(key)
    dup = self.dup
    if value == @value
      return @left.dup.insert_subtree(@right.dup)
    elsif value < @value
      dup.left = @left.dup.remove(value)
    else
      dup.right = @right.dup.remove(value)
    end

    dup
  end

  # def remove(key)
  #   dup = self.dup
  #   if @key == key
  #     return @left.dup.insert_subtree(@right.dup)
  #   elsif @key < key
  #     dup.left = @left.dup.remove(key)
  #   else
  #     dup.right = @right.dup.remove(key)
  #   end

  #   dup
  # end

  # @param [Comparable] key
  # @return [Object|nil]
  # def find(key)
  #   if key == @key
  #     return key_value
  #   elsif key < @key
  #     @left.find(key)
  #   else
  #     @right.find(key)
  #   end
  # end

  def sorted?
    return false if left.value > self.value
    return false if right.value < self.value
    left.sorted?
    right.sorted?
    return true
  end

  # def sorted?
  #   return false if left.key > self.key
  #   return false if right.key < self.key
  #   left.sorted?
  #   right.sorted?
  #   return true
  # end

  def min
    find_min_node.value
  end

  def find_min_node
    current_node = self
    while current_node.left
      current_node = current_node.left
    end
    current_node
  end

  protected
  def left=(value)
    @left = value
  end

  def right=(value)
    @right = value
  end

end
