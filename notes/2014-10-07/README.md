# Reverse Polish Notation

Here are some simple arithmetical expressions:

```
5 + 4
(5 + 4) * 7
15 - 2 + 4 * 3
```

```
+ 5 4   # Prefix notation (or Polish notation)
5 + 4   # Infix notation
5 4 +   # Postfix notation (or Reverse Polish notation)
```

### Parsing Infix

This is much harder than parsing prefix or postfix notation, even though it feels like the "natural" notation for us humans.  I wonder how much this "natural feeling" has to do with the fact that most European languages have a Subject-Verb-Object word order?  Japanese has Subject-Object-Verb, for example, which would correspond to postfix notation.

http://en.wikipedia.org/wiki/Shunting-yard_algorithm

## Advantages of Postfix and Prefix notation

1. You don't need the idea of "order of operations"
2. You never need parentheses

In action: 15 - 2 + 4 * 3

We "know" to do multiplication before addition.  That is, we "know" this expression should be parsed as

```
((15 - 2) + (4 * 3))
```

and *not*

```
((15 - 2) + 4) * 3)
```

In Polish/Reverse Polish notation, however, we don't need parentheses or order of operations to make the parse clear.  Consider...

- `(+ (- 15 2) (* 4 3))`
- `((15 2 -) (4 3 *) +)`
- `(* (+ (- 15 2) 4) 3)`
- `(((15 2 -) 4 +) 3 *)`

## Function Name Conventions

We put method/function names on the left, but we could just as easily put
them on the right, e.g.,

- `cos(9)   -> (9)cos`
- `add(x,y) -> (x,y)add`

## Evaluating RPN

```text
evaluate_rpn(tokens):
  stack  <- empty stack
  tokens <- extract_tokens(expr)

  for each token in tokens
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

  return pop(stack)
```

## Stacks (Abstract Data Type)

```
Stack
  Pattern: LIFO = last in, first out
  push(val) -> place val on stack
  pop       -> remove and return most recent val added to stack
  peek      -> return most recent val added to stack (don't remove)
  empty?    -> returns true if nothing on stack, returns false otherwise
```
