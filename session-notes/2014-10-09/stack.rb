# We will implement a Stack (abstract data type) in Ruby
# using an Array.  Pushing to the stack corresponds to appending
# to the end of the Array.  Popping from the stack corresponds to
# removing and return the last element of the Array.
class Stack
  class UnderflowError < StandardError;end

  def initialize
    @stack = []
  end

  def empty?
    @stack.empty?
  end

  def push(val)
    @stack.push(val)
  end

  def pop
    raise UnderflowError, "Stack is empty" if empty?
    @stack.pop
  end

  def peek
    @stack.last
  end
end
