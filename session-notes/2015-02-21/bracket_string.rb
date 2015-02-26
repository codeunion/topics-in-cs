# Write a function that detects whether {},(),[] brackets are properly nested.
# Here "properly" means that an inner pair of brackets must be closed before
# any outer brackets, a la HTML tags.

require_relative "stack"

class String
  def each_postfix
    0.upto(length - 1) do |i|
      yield(self[i..-1])
    end
  end
end

# def properly_nested?(pairs, string)
#   stack = Stack.new
#
#
#   string.each_postfix.all?
#
#   string.each_char do |char|
#     if opening_bracket?(pairs, char)
#       stack.push(char)
#     elsif closing_bracket?(pairs, char)
#       if stack.empty? || !brackets_match?(pairs, stack.peek, char)
#         return false
#       else
#         stack.pop
#       end
#     end
#   end
#
#   # If stack is not empty we have more opening brackets than closing brackets
#   return stack.empty?
# end

def propertly_nested?(pairs, string, bracket = nil)
  
end

def opening_bracket?(pairs, char)
  pairs.key?(char)
end

def closing_bracket?(pairs, char)
  pairs.values.include?(char)
end

def brackets_match?(pairs, left, right)
  pairs[left] ==  right
end

if __FILE__ == $PROGRAM_NAME
  BRACKET_PAIRS = {
    "{" => "}",
    "[" => "]",
    "(" => ")"
  }

  if ARGV.empty?
    puts "Enter a bracket string"
    exit 1
  end

  string = ARGV[0]

  puts properly_nested?(BRACKET_PAIRS, string)
end
