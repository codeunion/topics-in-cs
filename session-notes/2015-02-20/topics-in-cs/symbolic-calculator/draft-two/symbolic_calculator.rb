require 'bigdecimal'
require 'set'

require_relative 'expression'
require_relative 'constants'

module SymbolicCalculator

  class Calculator

    def initialize(string)
      @tokens = build_token_array(string)
    end

    def evaluate
      stack = []
      @tokens.each do |token|
        if BINARY_OPERATORS.include?(token)
          right = stack.pop
          left  = stack.pop
          stack.push(SymbolicCalculator::Expression.new(token, left, right).evaluate)
        else
          stack.push(SymbolicCalculator::Expression.new(token))
        end
      end

      stack[0]
    end

    def convert_string_to_numeric(string)
      # what if the string is not a number?
      num = BigDecimal.new(string)
      if num.frac == 0
        num.to_i
      else
        num.to_f
      end

    end

    def build_token_array(string)
      string.split(" ").map do |word|
        if BINARY_OPERATORS.include?(word) || VARIABLES.include?(word)
          word
        else
          convert_string_to_numeric(word)
        end

      end

    end

  end

end
