# Calculator

We're going to write a command-line "calculator" that understands [reverse Polish notation](http://en.wikipedia.org/wiki/Reverse_Polish_notation).  When we're done, it will work like this:

```console
$ ./calculator
rpn> 5 4 +
9
rpn> 5 4 + 7 *
63
rpn> 2 3 -
-1
rpn> 5 4 * 3 + 2 *
46
rpn> exit
Bye bye!
$
```

## What should I focus on?

1. Building familiarity with how RPN expressions are evaluated.  Try using this [online RPN calculator](http://www.cfd-online.com/Tools/rpncalc.html) to get a feel for how it works.
2. Implementing and using basic data structures
3. Representing abstract values as concrete objects in your code
4. [Tokenizing](http://en.wikipedia.org/wiki/Tokenization), [parsing](http://en.wikipedia.org/wiki/Parsing), and evaluating a "mini-language"

## The RPNExpression class

The core logic will live in the `RPNExpression` class, which is defined in `lib/rpn_expression.rb`.  Instances of this class represent a specific RPN expression and respond to an `#evaluate` method that returns the number representing the evaluated expression.

For example,

```ruby
RPNExpression.new("5 4 +").evaluate         # => 9
RPNExpression.new("5 4 + 7 *").evaluate     # => 63
RPNExpression.new("2 3 -").evaluate         # => -1
RPNExpression.new("5 4 * 3 + 2 *").evaluate # => 46
```

## Parsing and Evaluating RPN Expressions

An RPN expression consists of a sequence of tokens separated by spaces.  Every token represents _either_ a number _or_ an operator that consumes two numbers and returns a new number.  It is read from left to right and most easily processed using a [stack](http://en.wikipedia.org/wiki/Stack_%28abstract_data_type%29).

For example, the RPN expression

```
5 4 +
```

consists of two numbers (`5` and `4`) and a single operator (`+`).  The `+` operator consumes the `5` and `4` and returns `9`.

To parse and evaluate an RPN expression, then, you'll need to do a few things:

1. Convert the RPN expression into a list of tokens
2. Iterate through the list of tokens one at a time
3. If the current token is a number, what should you do?
4. If the current token is an operator, what should you do?
5. When you've iterated through all the tokens, what should you do?
