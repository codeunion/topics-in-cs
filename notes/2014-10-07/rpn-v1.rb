require "stack"

def factorial(n)
  result = 1

  n.downto(1) do |i|
    result *= i
  end

  result
end

class RPNExpression
  # Returns an object representing the supplied RPN expression
  #
  # @param expr [String] an RPN expression, e.g., "5 4 +"
  def initialize(expr)
    @expr = expr
  end

  # Evaluates the underlying RPN expression and returns the final result as a
  # number.
  #
  # @return [Numeric] the evaluated RPN expression

  # x + y == y + x for any x,y
  # 4 5 2 - * => 4 * (5 - 2)
  # 2 - 5 == -3
  # 4

  def evaluate
    stack = Stack.new

    tokens.each do |token|
      if numeric?(token)
        stack.push(token.to_i)
      elsif token == "+"
        # handle addition
        rhs = stack.pop  # right-hand side
        lhs = stack.pop  # left-hand side
        stack.push(lhs + rhs)
      elsif token == "*"
        rhs = stack.pop  # right-hand side
        lhs = stack.pop  # left-hand side
        stack.push(lhs * rhs)
      elsif token == "-"
        rhs = stack.pop  # right-hand side
        lhs = stack.pop  # left-hand side
        stack.push(lhs - rhs)
      elsif token == "/"
        rhs = stack.pop  # right-hand side
        lhs = stack.pop  # left-hand side
        stack.push(lhs / rhs)
      elsif token == "^"
        rhs = stack.pop  # right-hand side
        lhs = stack.pop  # left-hand side
        stack.push(lhs ** rhs)
      elsif token == "%"
        rhs = stack.pop  # right-hand side
        lhs = stack.pop  # left-hand side
        stack.push(lhs % rhs)
      elsif token == "max"
        rhs = stack.pop  # right-hand side
        lhs = stack.pop  # left-hand side
        stack.push([lhs, rhs].max)
      elsif token == "min"
        rhs = stack.pop  # right-hand side
        lhs = stack.pop  # left-hand side
        stack.push([lhs, rhs].min)
      elsif token == "rand"
        rhs = stack.pop  # right-hand side
        lhs = stack.pop  # left-hand side
        stack.push(rand(lhs..rhs))
      elsif token == "sample"
        rhs = stack.pop  # right-hand side
        lhs = stack.pop  # left-hand side
        stack.push([lhs, rhs].sample)
      elsif token == "!"
        num = stack.pop
        stack.push(factorial(num))
      else
        raise "omg what is this token even?"
      end
    end

    stack.pop
  end

  private

  def tokens
    @expr.split(" ")
  end

  def numeric?(token)
    # A string consisting of only:
    # * = 0 or more
    # ? = 0 or 1
    #   0 or 1 "-"" characters
    #   followed by 1 or more \d characters
    # \d means one of 0,1,2,3,4,5,6,7,8,9
    token =~ /^-?\d+$/
  end

  def operator?(token)
    ["+", "*"].include?(token)
  end
end
