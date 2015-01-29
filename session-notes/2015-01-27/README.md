# Session Notes: Topics in CS
## Tuesday, January 27, 2015

Trees, trees, trees!  The goal of this session was to highlight the importance
of representing/expressing the problem in a way naturally suited to the
problem.  If we're able to do that and translate that into code, our code will
almost always end up being smaller, simpler, and less fragile.

## Resources

1.  Jesse's implementation of `symbolic-calculator`:
    <https://github.com/jfarmer/symbolic-calculator/tree/expression-tree>

## What is a Tree?

A tree is a collection of (abstract) nodes, each of which contains some piece
of information typically called the node's "value."  Additionally, each node is
connected to

1.  0 or more "children" nodes
2.  0 or 1 "parent" nodes

Here's a (text) picture of a tree whose nodes contain numbers:

```text
      1
    /   \
   6     8
 / | \   |
9  0  5  7
        / \
      13  123
```

There is a "root node" which has no parent and from which no other node
descends.  Nodes which have no children are called "leaf nodes."

In the above tree, the node containing `1` is the root node.  The nodes
containing `9`, `0`, `5`, `13`, and `123` are leaf nodes.

## Special Types of Trees

In general, every node in a tree is permitted to have any number of children.
When we place the constraint on the tree that each node can have _at most_ 2
children, the tree is called a
[binary tree](http://en.wikipedia.org/wiki/Binary_tree).

## Examples of Trees

1.  Every HTML document encodes a tree (called the DOM tree).  Each HTML tag
    corresponds to a node and each nested child tag corresponds to that node's
    children.  Every HTML tag contains 0 or more other HTML tags, but every
    HTML tag is directly nested inside at _most_ one
2.  Every computer program can be translated into a tree called an
    [abstract syntax tree](http://en.wikipedia.org/wiki/Abstract_syntax_tree).
    Many interpreted languages (but not all) rely on this representation of a
    program to do their work.  Some programming languages like
    [Scheme](http://en.wikipedia.org/wiki/Scheme_%28programming_language%29)
    and [Clojure](http://en.wikipedia.org/wiki/Clojure) represent this tree
    directly in their syntax.
3.  Arithmetical and algebraic expressions can be represented abstractly
    using [binary expression trees](http://en.wikipedia.org/wiki/Binary_expression_tree).
