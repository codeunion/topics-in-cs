require_relative 'linked_list/base'

class Queue

  def initialize()
    @list = LinkedList::Base.new()
  end

  def enqueue(value)
    @list.prepend(value)

    self
  end

  def dequeue
    raise StandardError.new("Queue is empty") if empty?
    @list.shift
  end

  def peek
    @list.tail.value
  end

  def empty?
    @list.empty?
  end

  def size
    @list.length
  end

end
