require "set"

def normalize(word)
  word.chars.sort.join
end

def anagrams?(word1, word2)
  normalize(word1) == normalize(word2)
end

def anagram_of_any?(word, set)
  set.include?(word)
end

if __FILE__ == $PROGRAM_NAME
  words = STDIN.readlines.map(&:chomp)

  anagram_set = Set.new(words) { |word| normalize(word) }

  puts anagram_of_any?("apple", anagram_set)
end
