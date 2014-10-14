What does it mean to be as simplified as possible?

Something like this:

    simplify(expr) == expr

The mathy word for this is a "fixed point."

If f is a function and f(x) = x then x is a fixed point of x.

That is, f "doesn't move" the point x.

For example, _f(x) = x*x_.  f(0) = 0, f(1) = 1, but f(2) = 4

So 0 and 1 are fixed points of f(x) = x*x, but 2 is not.

Node
  OperatorNode
    AdditionNode
    MultiplicationNode
    SubtractionNode
    DivisionNode
    ExponentiationNode
  OperandNode
    VariableNode
    NumericNode

```ruby
class Node
  def parse(token, *args)
    case token
    case :+
      AdditionNode.new(*args)
    case :*
      MultiplicationNode.new(*args)
    case /^-?\d+$/
      NumericNode.new(token.to_i)
    else
      VariableNode.new(token)
    end
  end
end

class OperandNode < Node
end

class NumericNode < OperandNode
end

class VariableNode < OperandNode
end

class OperatorNode < Node
  attr_accessor :left, :right
  def initialize(left = nil, right = nil)
    @left  = left
    @right = right
  end

  def evaluate
    fail "Unknown operator"
  end
end

class AdditionNode < OperatorNode
  def evaluate
    self.left.value + self.right.value
  end
end

class MultiplicationNode < OperatorNode
  def evaluate
    self.left.value * self.right.value
  end
end
```
