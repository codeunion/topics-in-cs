class Tree
  attr_reader :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left  = left
    @right = right
  end

  def leaf?
    left.nil? && right.nil?
  end
end

class ExpressionTree < Tree
  def to_infix
    if self.leaf?
      self.value
    else
      "(#{self.left.to_infix} #{self.value} #{self.right.to_infix})"
    end
  end

  def to_prefix
    if self.leaf?
      self.value
    else
      "#{self.value} #{self.left.to_prefix} #{self.right.to_prefix}"
    end
  end

  def to_postfix
    if self.leaf?
      self.value
    else
      "#{self.left.to_postfix} #{self.right.to_postfix} #{self.value}"
    end
  end

  def evaluate
    if self
      self
    elsif self.value == "+"
      lhs = self.left.evaluate.value
      rhs = self.right.evaluate.value

      ExpressionTree.new(lhs + rhs, nil, nil)
    elsif self.value == "*"
      lhs = self.left.evaluate.value
      rhs = self.right.evaluate.value

      ExpressionTree.new(lhs * rhs, nil, nil)
    elsif self.value == "-"
      lhs = self.left.evaluate.value
      rhs = self.right.evaluate.value

      ExpressionTree.new(lhs - rhs, nil, nil)
    elsif self.value == "/"
      lhs = self.left.evaluate.value
      rhs = self.right.evaluate.value

      ExpressionTree.new(lhs / rhs, nil, nil)
    end
  end
end

#        +
#      /   \
#     +     7
#   /  \
#  5    4

#   self.left.evaluate == 9
#     +
#   /  \
#  5    4

#   5
#   4

#         +
#      /     \
#     x       4

# expr is a single String along the lines of "5 4 + 8 *"
def rpn_to_tree(expr)
  stack = []

  expr.split.each do |token|
    case token
    when /\A-?\d+\z/
      stack.push(ExpressionTree.new(token.to_i, nil, nil))
    when "+", "-", "*", "/"
      lhs, rhs = stack.pop(2)
      stack.push(ExpressionTree.new(token, lhs, rhs))
    else
      fail "Unknown token #{token.inspect}"
    end
  end

  stack.pop
end

if __FILE__ == $PROGRAM_NAME
  tree = rpn_to_tree(ARGV.join(" "))

  puts tree.evaluate.value
end
