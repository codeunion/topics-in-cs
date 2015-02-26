def TreeNode(value, children = [])
  case value
  when TreeNode
    value
  else
    TreeNode.new(value, children)
  end
end

class TreeNode

  attr_reader :value, :children

  def initialize(value, children = [])
    @value = value
    @children = children
  end

  def children
    @children
  end

  def add_child(value)
    children.push(TreeNode(value))
  end

  def remove_child(value)
    children.remove(TreeNode(value))
  end

end
