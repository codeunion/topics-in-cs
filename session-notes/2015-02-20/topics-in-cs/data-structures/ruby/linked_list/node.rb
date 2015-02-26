require_relative 'linked_list_node'

module LinkedList
  class Node

    include LinkedList

    attr_reader :value
    attr_accessor :next

    def initialize(value = nil, nxt = nil)
      @value = value
      @next = nxt
    end

    def insert_after(value)
      node = LinkedListNode(value)
      node.next = self.next if self.next
      self.next = node

      self
    end

    def insert_before(value)
      node = LinkedListNode(value)
      node.next = self

      node
    end

    def empty?
      false
    end

  end
end
