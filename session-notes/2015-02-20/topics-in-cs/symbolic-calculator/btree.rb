module BTree

  class BTree
    attr_accessor :root

    def initialize(root = Sentinel.new) # wonder if specifying a sentinel class instead of Node.new(nil, nil, nil) will unwanted side effects
      @root = root
    end

    def build(collection)
      #probably needs to be implemented by subclasses of BTree: balanced, expression, sorted, etc.
    end

    # def findTopMostNotFullNode
      recurse through levels and return first 
    # end

  end

  class Node

    attr_accessor :value, :left, :right

    def initialize(value, left, right)
      @value  = value
      @left   = left
      @right  = right
    end

    def full?
      @right && @left
    end

    def empty?
      !@right && !@left
    end

    def half_full?
      !@right || !@left
    end

    def not_full?
      !full
    end

  end

  class Leaf < Node  # wonder if needing to transform leaves into normal nodes in the case of adding onto a tree is worth the benefits of subclassing

    def initialize(value)
      @value  = value
      @left   = nil
      @right  = nil
    end

  end

  class Sentinel < Leaf

    def initialize
      @value  = nil
      @left   = nil
      @right  = nil
    end

  end

end