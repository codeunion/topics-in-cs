class BinaryExpressionTree
  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def evaluate
    case @value
    when "+"
      if self.left.value == 0
        self.right.evaluate
      elsif self.right.value == 0
        self.left.evaluate
      else
        self.left.evaluate + self.right.evaluate
      end
    when "*"
      if self.left.value == 0
        0
      elsif self.right.value == 0
        0
      else
        self.left.evaluate * self.right.evaluate
      end
    when "-"
      if self.left.value == 0
        self.right.evaluate
      elsif self.right.value == 0
        self.left.evaluate
      else
        self.left.evaluate - self.right.evaluate
      end
    when /-?\d+/
      self.value.to_i
    else
      self.value
    end
  end
end
