class Node
  def self.operators
    {
      '+' => AdditionNode,
      '-' => SubtractionNode,
      '*' => MultiplicationNode,
      '/' => DivisionNode
    }
  end

  def self.operator(token)
    operators[token]
  end

  def self.operator?(token)
    operators.key?(token)
  end

  def self.load(token, *args)
    if operator?(token)
      operator(token).new(*args)
    elsif token =~ /^-?\d+$/
      NumericNode.new(token.to_i)
    else
      VariableNode.new(token.to_sym)
    end
  end

  def simplify
    self
  end
end

class OperandNode < Node
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_s
    value.to_s
  end
end

class NumericNode < OperandNode
  def ==(other)
    other.is_a?(NumericNode) && value == other.value
  end
end

class VariableNode < OperandNode
  def ==(other)
    other.is_a?(VariableNode) && value == other.value
  end
end

class OperatorNode < Node
  attr_accessor :left, :right
  def initialize(left = nil, right = nil)
    @left  = left
    @right = right
  end

  def simplify
    fail "Unknown operator"
  end
end

class AdditionNode < OperatorNode
  def to_s
    "(#{self.left.to_s} + #{self.right.to_s})"
  end

  def simplify
    lhs = left.simplify
    rhs = right.simplify

    if lhs.is_a?(NumericNode) && rhs.is_a?(NumericNode)
      NumericNode.new(lhs.value + rhs.value)
    elsif lhs.is_a?(NumericNode) && lhs.value == 0
      rhs
    elsif rhs.is_a?(NumericNode) && rhs.value == 0
      lhs
    else
      AdditionNode.new(lhs, rhs)
    end
  end
end

class SubtractionNode < OperatorNode
  def to_s
    "(#{self.left.to_s} - #{self.right.to_s})"
  end

  def simplify
    lhs = left.simplify
    rhs = right.simplify

    if lhs.is_a?(NumericNode) && rhs.is_a?(NumericNode)
      NumericNode.new(lhs.value - rhs.value)
    elsif lhs.is_a?(OperandNode) && rhs.is_a?(OperandNode) && lhs == rhs
      NumericNode.new(0)
    elsif rhs.is_a?(NumericNode) && rhs.value == 0
      lhs
    else
      SubtractionNode.new(lhs, rhs)
    end
  end
end


class MultiplicationNode < OperatorNode
  def to_s
    "(#{self.left.to_s} * #{self.right.to_s})"
  end

  def simplify
    lhs = left.simplify
    rhs = right.simplify

    if lhs.is_a?(NumericNode) && rhs.is_a?(NumericNode)
      NumericNode.new(lhs.value * rhs.value)
    elsif lhs.is_a?(NumericNode) && lhs.value == 0
      NumericNode.new(0)
    elsif rhs.is_a?(NumericNode) && rhs.value == 0
      NumericNode.new(0)
    elsif lhs.is_a?(NumericNode) && lhs.value == 1
      rhs
    elsif rhs.is_a?(NumericNode) && rhs.value == 1
      lhs
    else
      MultiplicationNode.new(lhs, rhs)
    end
  end
end

class DivisionNode < OperatorNode
  def to_s
    "(#{self.left.to_s} / #{self.right.to_s})"
  end

  def simplify
    lhs = left.simplify
    rhs = right.simplify

    if lhs.is_a?(NumericNode) && rhs.is_a?(NumericNode)
      NumericNode.new(Rational(lhs.value, rhs.value))
    elsif rhs.is_a?(NumericNode) && rhs.value == 1
      lhs
    else
      DivisionNode.new(lhs, rhs)
    end
  end
end
