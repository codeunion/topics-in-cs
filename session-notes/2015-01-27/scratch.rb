class Node
  attr_reader :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left  = left
    @right = right
  end

  def leaf?
    left.nil? && right.nil?
  end

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
end

def factorial(n)
  if n == 1
    1
  else
    n * factorial(n-1)
  end
end

# 5! = 5*4!
#    = 5*(4*3!)
#    = 5*(4*(3*2!))
#    = 5*(4*(3*(2*1!)))
#    = 5*4*3*2*1
#    = 5*4*3*2
#    = 5*4*6
#    = 5*24
#    = 120

def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  return fib(n - 1) + fib(n - 2)
end

# 6 -17 + 123 *
#
#        *
#      /   \
#     +    123
#   /  \
#  6   -17
#
#  left expression: "6 -17 +"
#  right expression: "123"
#  "<left-in-rpn> <right-in-rpn> <operator>"

#     +
#   /  \      => "6 -17 +"
#  6   -17


# Tree: [7]
# Expr: 7

tree = Node.new(
"*",
Node.new(
"+",
Node.new(6),
Node.new(-17)
),
Node.new(123)
)

puts "prefix:  #{tree.to_prefix}"
puts "infix:   #{tree.to_infix}"
puts "postfix: #{tree.to_postfix}"
