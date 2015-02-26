require_relative 'node'

module DoublyLinkedList

  def DoublyLinkedListNode(value, nxt = nil, prev = nil)
    case value
    when DoublyLinkedList::Node
      value
    else
      DoublyLinkedList::Node.new(value, nxt, prev)
    end
  end

end
