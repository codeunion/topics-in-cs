require "stack"
require "binary_expression_tree"

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
  def evaluate(bindings = {})
    stack = Stack.new

    tokens.each do |token|
      if numeric?(token)
        stack.push(BinaryExpressionTree.new(token.to_i))
      elsif variable?(token)
        if bindings.key?(token.to_sym)
          stack.push(BinaryExpressionTree.new(bindings[token.to_sym]))
        else
          stack.push(BinaryExpressionTree.new(token))  # For raw variables and no bindings
        end
      elsif operator?(token)
        rhs = stack.pop
        lhs = stack.pop
        stack.push(BinaryExpressionTree.new(token, lhs, rhs))
      end
    end

    stack.pop.evaluate
  end

  private

  def tokens
    @expr.split(" ")
  end

  def numeric?(token)
    token =~ /^-?\d+$/
  end

  def variable?(token)
    token =~ /^[a-z]{1}/
  end

  def operator?(token)
    ["*", "+", "-"].include?(token)
  end
end
