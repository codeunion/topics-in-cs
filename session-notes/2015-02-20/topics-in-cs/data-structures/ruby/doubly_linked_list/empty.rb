require_relative 'node'

module DoublyLinkedList
  class Empty < DoublyLinkedList::Node

    attr_reader :value

    def initialize
      @value = nil
      @prev = nil
      @next = nil
    end

    def empty?
      true
    end

  end
end
