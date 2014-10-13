(x + y) + z = x + (y + z)
(x - y) - z != x - (y - z)


(1 2 -) 3 -
(1 - 2) - 3 == -4

1 - (2 - 3) == 2

1 2 3 - -

as tokens, this is just [1,2,3,-,-]

as tokens [15, 2, *, 4, 3, * +]
((15 2 *) (4 3 *) +)

4 7 3 + 8 * 16 + *

10
4
cos

5 4 + cos

5^4 = 5*5*5*5
/
-
*
+
^

cos(9)   -> (9)cos
add(x,y) -> (x,y)add


stack <- empty stack

for each token
  if token is number
    push(stack, token)
  else if token is +
    right = pop(stack)
    left  = pop(stack)
    sum = left + right
    push(stack, sum)
  else if token is *
    right = pop(stack)
    left  = pop(stack)
    product = left * right
    push(stack, product)
  endif
endfor

384
                 *
*                4         +
2   --->   ----> 3   ---> 12  ---> 42  (and done)
15      30       30       30

-
-1
1

"Abstract Data Type"

Stack
  Pattern: LIFO = last in, first out
  push(val) -> place val on stack
  pop       -> remove and return most recent val added to stack
  peek      -> return most recent val added to stack (don't remove)
  empty?    -> returns true if nothing on stack, returns false otherwise
