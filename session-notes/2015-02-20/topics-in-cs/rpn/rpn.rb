module RPN
  require 'set'

  OPERATORS = Set.new(%w[+ - / * ** %])

  class Expression

    def initialize(string)
      @tokens = string.split(" ")
      @stack = []
    end

    def evaluate
      count = @tokens.count
      # puts "count: #{count}"
      # puts "stack: #{@stack}"
      if count == 0 && @stack.count == 0
        nil
      elsif count == 0 && @stack.count == 1
        @stack[0]
      else
        arg = @tokens.shift
        if OPERATORS.include?(arg)
          # puts "operator #{arg}"
          right = @stack.pop
          left = @stack.pop
          @stack << eval(left.concat(arg).concat(right)).to_s
          self.evaluate
        else #assumes it is a valid number
          @stack << arg
          self.evaluate
        end

      end

    end

  end

end
