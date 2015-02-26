require 'set'
require_relative "btree"

module SymCalc

  OPERATORS = Set.new(%W[+ - * / **])
  NUMBERS   = Set.new((0..9)) #deal with negative numbers, integers greater than 9, decimals, floats, etc.
  VARIABLES = Set.new(("a".."z")).merge(("A".."Z"))
  OPERANDS  = NUMBERS.merge(VARIABLES)

  class Expression

    def initialize(string)
      @tokens = string.split(" ")
      @btree = build_btree(@tokens)
    end

    #TODO
    def valid?
      # all tokens valid? right number of operators and tokens?
    end

    def build_btree(tokens)
      tokens.map! do |token|
        case token
        when OPERATORS.include?(token)
          BTree::Node.new(token)
        when OPERANDS.include?(token)
          BTree::Leaf.new(token)
        end
      end

      # build btree
      btree = BTree::BTree.new(tokens.pop)
      current_node = btree.root

      while tokens.count > 0
        token = tokens.pop
        klass = token.class

        if !current_node.right
          current_node.right = token
        else
          current_node.left = token
          if klass == Node
            current_node = token
          elsif klass == Leaf && tokens.count > 0 # If it is a leaf but not the last token
            current_node = find_upper_most_not_full_node(btree)
          end

        end

      end

      btree
    end

    def find_upper_most_not_full_node(btree) #lower most? closest to the root.
      # this only works because we always assign the right side first
      # TODO write a more generalized version of this inside of btree class
      current_node = btree.root
      while current_node.full? && current_node.left
        current_node = current_node.left
      end
      # what if there isn't one
      current_node
    end


  end

  class Calculator

    def initialize
    end

    def evaluate(expression)
      btree   = expression.btree
      evaluate_private(btree.root)
    end

    private
    def evaluate_private(node)
      #recurse through the btree
      if node.class == Leaf
        node.value
      elsif node.right.class == Leaf && node.left.class == Leaf
        eval(node.left.value + node.value + node.right.value)
      else
        eval(evaluate_private(node.left) + node.value + evaluate_private(node.right))
      end
    end

  end

  # class Token
  # end

  # class Operator < Token
  # end

end
