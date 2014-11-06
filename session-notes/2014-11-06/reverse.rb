class Node
  def reverse
    if self.next.nil?
      self
    else
      results = self.next.reverse
      self.next.next = self
      self.next = nil

      results
    end
  end
end

def reverse(head)
  if head.next.nil?
    head
  else
    results = reverse(head.next)
    head.next.next = head
    head.next = nil

    results
  end
end
