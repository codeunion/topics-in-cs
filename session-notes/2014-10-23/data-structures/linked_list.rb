class LinkedList
  # By implementing LinkedList#each, we can include Enumerable
  include Enumerable

  attr_reader :head, :tail

  def initialize
    @head = Node.new(nil)
    @tail = @head

    # Just "nil" isn't great because we won't be able to guarantee
    # that @head.next and @head.value will always make sense.
  end

  # O(1) time
  def unshift(value)
    new_head = Node(value)
    new_head.next = @head
    @head = new_head

    self
  end

  # O(1) time
  def shift
    result = @head.value
    @head = Node(@head.next)
    result
  end

  def append(value)
    new_tail = Node(value)
    @tail.next = new_tail.next
    @tail = new_tail

    self
  end

  # O(1) time
  def empty?
    self.head.empty?
  end

  def each(&block)
    node = self.head

    until node.empty?
      block.call(node.value)
      node = node.next
    end

    self
  end

end

# This allows us to call Node(value) and is different
# than the class "Node".  This is how Ruby methods
# like Integer(value), Array(value), String(value), etc.
# work.
def Node(value)
  case value
  when Node
    value
  else
    Node.new(value)
  end
end

# list = LinkedList.new
# list.prepend(5)
# some_node
# list.prepend(some_node)
# list.prepend(some_node.value)
#

class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next  = next_node
  end

  # O(1) time
  # Insert +value+ after this Node and return new Node
  def insert_after(value)
    node = Node(value)
    node.next = self
    node
  end

  def empty?
    value.nil?
  end
end
