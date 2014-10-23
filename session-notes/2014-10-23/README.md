# Data Structures

## Linked Lists vs. Arrays

Operation    LL     Array
push        O(1)   O(1)
pop         O(n)   O(1)
unshift     O(1)   O(n)
shift       O(1)   O(n)
insert      O(1)   O(n)
remove      O(1)   O(n)
random
 access     O(n)   O(1)


node

(insert after)
old_next = node.next
node.next = new_node
return node


array[3]
array is 8 things long
array[8] = array[7]
array[7] = array[6]
array[6] = array[5]
array[5] = array[4]
array[4] = new_value
