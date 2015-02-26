class LinkedList
  attr_reader :value
  attr_accessor :next

  # We have to use "rest" as the argument name because "next"
  # is a reserved keyword in Ruby.
  def initialize(value, rest = EmptyList.new
    @value = value
    @next  = rest
  end

  def each(&block)
    node = self
    until node.empty?
      block.call(node.value)
      node = node.next
    end
  end

  def empty?
    false
  end

  def unshift(value)
    LinkedList.new(value, self)
  end

  def shift
    self.next
  end
end

class EmptyList < LinkedList
  def initialize(value = nil, rest = nil)
    @value = nil
    @next  = self
  end

  def empty?
    true
  end
end

# We are free to choose how to represent the end of a list.
# Often we'll represent the end of a list using the underlying
# programming language's null/nil/empty type.
#
# However, it can be useful to define our own custom "empty list"
# type.  For example, if we use nil to represent the end of a list
# then LinkedList#unshift will return nil for a single element list.
# Whoever is calling unshift will have to check for this case
# explicitly vs. knowing that LinkedList#unshift will always return
# a (possibly empty) list.

if __FILE__ == $PROGRAM_NAME
  p LinkedList.new(10).value == 10
  p LinkedList.new(10).empty? == false
  p LinkedList.new(10).unshift.empty? == true
  p LinkedList.new(10, LinkedList.new(20)).unshift.empty? == false
  p LinkedList.new(10, LinkedList.new(20)).next.value == 20

  p EmptyList.new.empty? == true
  p EmptyList.new.shift(10).empty? == false
  p EmptyList.new.unshift.empty? == true
end
