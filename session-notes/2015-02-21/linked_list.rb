class LinkedList
  # By implementing LinkedList#each, we can include Enumerable
  include Enumerable

  attr_reader :head, :length

  def self.node(value, next_node = nil)
    case value
    when LinkedList::Node
      value
    when nil
      LinkedList::EmptyNode.new
    else
      LinkedList::Node.new(value, next_node)
    end
  end

  def initialize
    @head   = LinkedList::EmptyNode.new
    @length = 0
  end

  # O(1) time
  def unshift(value)
    self.tap do
      @head = head.insert_before(value)
      @length += 1
    end
  end

  # O(1) time
  def shift
    result = @head.value
    @head = head.next
    @length = [length - 1, 0].max

    result
  end

  # O(1) time
  def empty?
    head.empty?
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

class LinkedList
  class Node
    attr_accessor :value, :next

    def initialize(value = nil, next_node = nil)
      if value.nil?
        fail ArgumentError, "Can't initialize Node with nil value"
      end

      @value = value
      @next  = LinkedList.node(next_node)
    end

    # O(1) time
    # Insert +value+ after this LinkedListNode and return new LinkedListNode
    def insert_after(value)
      LinkedList.node(value, self.next.next).tap do |node|
        self.next = node
      end
    end

    # O(1) time
    # Insert +value+ before this LinkedListNode and return new LinkedListNode
    def insert_before(value)
      LinkedList.node(value, self)
    end

    def empty?
      false
    end
  end

  class EmptyNode < Node
    def initialize(value = nil, next_node = nil)
      unless value.nil?
        fail ArgumentError, "Can't initialize EmptyNode with non-nil value `#{value}'"
      end

      @value = nil
      @next  = self
    end

    def insert_after(value)
      LinkedList.node(value, self)
    end

    def insert_before(value)
      LinkedList.node(value, self)
    end

    def empty?
      true
    end
  end
end
