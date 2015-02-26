module NTree

    # def initialize(value, parent = nil, children = nil)
    #   @value = value
    #   @parent = parent
    #   @children = children
    # end

    def root?
      @parent.nil?
    end

    # @return [NTree]
    def head_child
      if @children
        @children.head
      else
        nil
      end
    end

    # @param [*] value
    def head_child=(value)
      @children.prepend(value)
    end

    # @param [*] value
    def append_child(value, parent = self, children = nil, nxt = nil, prev = nil)
      if @children.nil?
        @children = self.class.new(value, parent, children, nxt, prev) #wrapper with head and tail?
      else
        @children = @children.append(self.class.new(value, parent))
      end
    end

    # @param [*] value
    def prepend_child(value)
      if @children.nil?
        @children = self.class.new(value)
      else
        @children = @children.prepend(self.class.new(value))
      end
    end

    # @param [Enumerable<*>] children
    def prepend_children(children)
      children.length.times { prepend_child(children.pop) }
    end

    # @param [Enumerable<*>] children
    def append_children(children)
      children.each { | child | append_child(child) }
    end

end
