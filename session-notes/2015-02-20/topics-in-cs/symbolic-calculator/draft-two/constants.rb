module SymbolicCalculator

  BINARY_OPERATORS = Set.new(%W[+ - * / **])
  NUMBERS   = Set.new((0..9)) #deal with negative numbers, integers greater than 9, decimals, floats, etc.
  VARIABLES = Set.new(("a".."z")).merge(("A".."Z"))
  OPERANDS  = NUMBERS.merge(VARIABLES)
  INFINITY = "Infinity"

  ARITHMETIC_TABLE = {
    "+" => ->(left, right) { left + right },
    "-" => ->(left, right) { left - right },
    "*" => ->(left, right) { left * right },
    "/" => ->(left, right) { left / right },
    "**" => ->(left, right) { left ** right }
  }

end