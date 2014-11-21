# Parens Problem

## Problem Statement

Write a function that takes a string with parens and the position of an opening parens and returns the position of the specified opening parens' closing pair.

## Example Input

```
Reality        Representation
-----------------------------
Input
()((())())()  "()((())())()"
  ^           2

...... = some arbitrary sequence of '(' and ')'

(...............)  <--- ......... must be balanced
((.............))  <--- second char must be (, second-to-last must be )

()()()((((())))()()()()()()()()()()((((())))))

Output
  v                          v
()()))))()()()((((((
   pmpmmmpmppmm
  (((()))()())



Output
root => (a)(((b))(c))(d)  "()((())())()"
 ^            1

(a)
(
  (
    (b)
  )
  (c)
)
(d)

```

```
Input
"(hello (world how) (are you))"
        ^
Output
"(hello (world how) (are you))"
                  ^

Input
"(hello (world how) (are you))"
 ^

Output
"(hello (world how) (are you))"
                             ^
```
