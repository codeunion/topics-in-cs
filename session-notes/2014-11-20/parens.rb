def matching_parens(string, pos)
  count = 0
  initial_pos = pos + 1
  string[initial_pos..-1].chars.each_with_index do |char, i|
    if char == '('
      count += 1
    elsif char == ')'
      if count == 0
        return initial_pos + i 
      else
        count -= 1
      end
    end
  end

  return nil
end

if __FILE__ == $PROGRAM_NAME
  puts matching_parens('()', 0) == 1
  puts matching_parens('()()', 2) == 3
  puts matching_parens('(())', 0) == 3
  puts matching_parens('(()())()(((()()))(()))', 8) == 21
  puts matching_parens('(', 0) == nil
  puts matching_parens('(((((((', 1) == nil
end
