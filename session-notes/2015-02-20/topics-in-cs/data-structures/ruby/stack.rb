class Stack
  class UnderflowError < StandardError
  end

  attr_reader :list

  # @memory BigO(n)
  def initialize
    @list = LinkedList::Base.new()
  end

  # Places +item+ on the top of the stack
  # @time BigO(1)
  def push(value)
    @list.unshift(value)

    self
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  # @time BigO(1)
  def pop
    if @list.length == 0
      UnderflowError.new("Underflow Error: stack is empty")
    else
      @list.shift
    end
  end

  # Return the item on the top of the stack without removing it
  # @time BigO(1)
  def peek
    @list.peek
  end

  # Return true if the stack is empty and false otherwise
  # @time BigO(1)
  def empty?
    @list.empty?
  end

  # Return the number of items on the stack
  # @time BigO(1)
  def size
    @list.length
  end

  def ==(other)
    return false unless other.instance_of?(self.class) && size = other.size
    @list == other.list
  end

end
