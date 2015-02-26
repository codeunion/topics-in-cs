require_relative 'stack'

class MaxStack < Stack

  def initialize
    super
    @max_stack = Stack.new()
  end

  def max
    @max_stack.peek
  end

  def push(value)
    @max_stack.push(value) if @max_stack.empty? || @max_stack.peek >= value
    super(value)
  end

  def pop
    @max_stack.pop if peek == @max_stack.peek
    super
  end

end
