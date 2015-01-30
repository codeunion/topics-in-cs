require_relative "linked_list"

class Stack
  def initialize
    @list = EmptyList.new
  end

  def push(value)
    @list = @list.shift(value)

    self
  end

  def pop
    result = @list.value

    @list = @list.unshift

    result
  end

  def peek
    @list.value
  end

  def empty?
    @list.empty?
  end
end

if __FILE__ == $PROGRAM_NAME
  p Stack.new.pop == nil
  p Stack.new.push(10).pop == 10
  p Stack.new.push(10).push(20).pop == 20
  p Stack.new.push(10).peek == 10

  stack = Stack.new.push(10)
  stack.pop
  p stack.empty? == true
end
