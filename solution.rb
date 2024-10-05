def sanitize_words (words)
  words = words.gsub!(/[!,?.]/, '') || words
    .downcase
end

def substrings (words, dictionary)
  res = Hash.new(0)
  
  sanitize_words(words)
  .split()    # split sentences to weach word
  .each { |w| find_sub_string_and_update(w, dictionary, res)}
  
  return res
end

def find_sub_string_and_update (w, dictionary, res)
  
  for i in 0...w.length
    for j in i...w.length
      sub_str = w.slice(i..j)
      if dictionary.include?(sub_str)
        res[sub_str] += 1
      end
    end
  end
  
  
end


# Test cases

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p dictionary

puts ""

p substrings("below", dictionary)  # { "below" => 1, "low" => 1 }

puts ""

p substrings("Howdy partner, sit down! How's it  going?", dictionary) #  { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }