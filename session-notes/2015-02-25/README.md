# Session Notes: Topics in CS
## Wednesday, February 25, 2015

## Deleting from a BST

### Possible Cases

1. If a node is a leaf, replace with an empty node
2. If node has only left child, replace with right child
3. If node has only right child, replace with left child
4. If node has two children...
     - Find node w/ largest value in left child (left max)
     - Replace node with (left max)
     - Delete (left max) from left child

 Because the (left max) has the largest value in the left sub tree,
 it won't have any right children (by definition).  This means when
 we go to delete it we'll hit a base case and know how to delete it
 easily.
