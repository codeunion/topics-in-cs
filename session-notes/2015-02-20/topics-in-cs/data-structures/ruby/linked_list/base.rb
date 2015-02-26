require_relative 'empty'
require_relative 'node'
require_relative 'linked_list_node'

module LinkedList
  class Base

    include LinkedList
    include Enumerable

    attr_reader :head, :tail, :length

    def initialize()
      empty = LinkedList::Empty.new()
      @head = empty
      @tail = empty
      @length = 0
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
      node = LinkedListNode(value, @head)
      if @head.empty?
        @head = node
        @tail = node
      else
        @head = node
      end

      @length += 1

      self
    end

    def prepend(value)
      node = LinkedListNode(value)
      if empty?
        @head = node
        @tail = node
        @tail.next = nil
      else
        @tail.insert_after(node)
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

    def peek
      @head.value
    end

    def empty?
      @head.empty?
    end

    def length?
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
