require "stack"

def factorial(n)
  result = 1

  n.downto(1) do |i|
    result *= i
  end

  result
end

# An operator that takes 1 argument is called a unary operator
# An operator that takes 2 arguments is called a binary operator
# An operator that takes 3 arguments is called a ternary operator
# An operator that takes 4 arguments is called a 4-ary operator
# An operator that takes 5 arguments is called a 5-ary operator
# An operator that takes N arguments is called a N-ary operator
# So, let's call the number of arguments an operator takes the
#   "arity" of the operator.
# A 2-ary (or binary) operator has an arity of 2
# An N-ary operator has an arity of N


SYMBOL_TABLE = {
  "+" => lambda { |x,y| x + y },
  "*" => lambda { |x,y| x * y },
  "!" => lambda { |n|   factorial(n) },
  "%" => lambda { |x,y| x % y }
}

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
      elsif operator?(token)
        args = []

        SYMBOL_TABLE[token].arity.times do
          # This adds the return value of stack.pop to the beginning of the
          # args array
          args.unshift(stack.pop)
        end

        # The *args syntax might be unfamiliar.  It's called the "splat"
        # operator and among other things it lets you turn an array into
        # a list of arguments.
        stack.push(call_operator(token, *args))
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
    SYMBOL_TABLE.key?(token)
  end

  def call_operator(operator, *args)
    SYMBOL_TABLE[operator].call(*args)
  end
end
