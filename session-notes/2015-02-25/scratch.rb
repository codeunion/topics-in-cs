


# Destructive remove
tree.include?("apples")  # => true
tree.remove("apples")
tree.include?("apples")  # => false

# Non-destructive remove
tree.include?("apples") # => true
new_tree = tree.remove("apples")
new_tree.include?("apples") # => false
tree.include?("apples") # => true

def remove(tree, value_to_remove)
  values = []
  tree.each_node do |node|
    unless node.value == value_to_remove
      values << node.value
    end
  end

  new_tree = BinaryTree.new
  values.each do |value|
    new_tree.insert(value)
  end

  new_tree
end
