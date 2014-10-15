require 'stack'
require 'node'

class UndefinedVariableError < StandardError; end

class Expression
  # Returns a new expression
  def initialize(expr)
    @expr = expr
  end

  # Evaluates an expression, simplifying if possible.
  #
  # @param bindings [Hash] a map of variable names to concrete values
  # @return [Expression] Returns a possibly-simplified Expression
  def simplify(bindings = {})
    stack = Stack.new

    tokens.each do |token|
      if Node.operator?(token)
        rhs = stack.pop
        lhs = stack.pop
        stack.push(Node.load(token, lhs, rhs))
      elsif bindings.key?(token)
        stack.push(Node.load(bindings[token]))
      else
        stack.push(Node.load(token))
      end
    end

    stack.pop.simplify
  end

  private

  def tokens
    @tokens ||= @expr.split(' ')
  end

  def operator?(token)
    ['+', '-', '*'].include?(token)
  end
end
