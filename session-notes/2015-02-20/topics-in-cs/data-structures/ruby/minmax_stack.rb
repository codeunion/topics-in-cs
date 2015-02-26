require_relative 'stack'

class MinmaxStack < Stack

  def initialize
    super
    @max_stack = Stack.new()
    @min_stack = Stack.new()
  end

  # @time BigO(1)
  # @return [Object]
  def min
    @min_stack.peek
  end

  # @time BigO(1)
  # @return [Object]
  def max
    @max_stack.peek
  end

  # @time BigO(1)
  # @param [Object] value
  def push(value)
    push_to_max_stack_if_max(value)
    push_to_min_stack_if_min(value)
    super(value)
  end

  # @time BigO(1)
  # @return [Object]
  def pop
    pop_max_stack_if_max
    pop_min_stack_if_min
    super
  end

  private
  # @private
  # @time BigO(1)
  # @param [Object] value
  def push_to_max_stack_if_max(value)
    @max_stack.push(value) if @max_stack.empty? || @max_stack.peek >= value
  end

  # @private
  # @time BigO(1)
  # @param [Object] value
  def push_to_min_stack_if_min(value)
    @min_stack.push(value) if @min_stack.empty? || @min_stack.peek <= value
  end

  # @private
  # @time BigO(1)
  # @return [Object]
  def pop_max_stack_if_max
    @max_stack.pop if peek == @max_stack.peek
  end

  # @private
  # @time BigO(1)
  # @return [Object]
  def pop_min_stack_if_min
    @min_stack.pop if peek == @min_stack.peek
  end

end
