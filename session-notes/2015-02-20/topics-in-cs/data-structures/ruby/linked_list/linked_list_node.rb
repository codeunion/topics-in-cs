require_relative 'node'

module LinkedList

  def LinkedListNode(value, nxt = nil)
    # NOTE: ruby case statements use ===
    # NOTE: when LinkedList::Node === case value
    # NOTE: LinkedList::Node === value.class #=> LinkedList::Node === Class #=> false
    # NOTE: http://stackoverflow.com/questions/3801469/how-to-catch-errnoeconnreset-class-in-case-when
    case value
    when LinkedList::Node
      value
    else
      LinkedList::Node.new(value, nxt)
    end
  end

end
