require_relative 'empty'
require_relative 'node'
require_relative 'doubly_linked_list_node'

module DoublyLinkedList
  class Base

    include DoublyLinkedList
    include Enumerable

    attr_reader :head, :tail, :length

    def initialize()
      empty = DoublyLinkedList::Empty.new()
      @head = empty
      @tail = empty
      @length = 0
    end

    def tail
      @tail
    end

    def calculate_length
      length = 0
      placeholder = @head
      until placeholder.empty? do
        length += 1
        placeholder = placeholder.next
      end
      length
    end

    def find_tail
      placeholder = @head
      if placeholder.empty?
        @head
      else
        until placeholder.next.empty? do
          placeholder.next
        end
        placeholder
      end
    end

    def each(&block)
      placeholder = @head
      until placeholder.empty? do
        block.call(placeholder.value)
        placeholder = placeholder.next
      end

      self
    end

    def shift
      head = @head
      @head = @head.next
      @length -= 1
      head.value
    end

    def unshift(value)
      node = DoublyLinkedListNode(value, @head)
      if @head.empty?
        @head = node
        @tail = node
      else
        @head.prev = node
        @head = node
      end

      @length += 1

      self
    end

    def unshift_all(enumerable)
      #TODO
    end

    def insert
      #TODO
    end

    def remove_from_tail
      raise StandardError.new("Linked List is empty") if empty?
      removed = @tail
      empty = @tail.next
      if @length == 1
        @head = empty
        @tail = empty
      else
        @tail = @tail.prev
        @tail.next = empty
      end

      @length -= 1
      removed.value
    end

    def peek
      @head.value
    end

    def empty?
      @head.empty?
    end

    def ==(other)
      return false if !other.instance_of?(self.class) || length != other.length
      placeholder_one = head
      placeholder_two = other.head
      while !placeholder_one.empty?
        return false if placeholder_one.value != placeholder_two.value
        placeholder_one = placeholder_one.next
        placeholder_two = placeholder_two.next
      end

      return true
    end

  end
end
