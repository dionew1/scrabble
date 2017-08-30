class Scrabble

  def score(word)
    letter_values = point_values
    if word == "" || word == nil
      0
    else
      word.split("").map do |letter|
        letter_values[letter.upcase]
      end.reduce(:+)
    end
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def greater_than_7_bonus(word)
    score = 0
    word_length = word.length
    if word_length >= 7
      10 + score
    else
      score
    end
  end


  def score_with_mulitpliers(word, letter_multipliers, multiplier = 1)
    #require 'pry'; binding.pry
    letter_values = point_values
    bonus = greater_than_7_bonus(word)
    word_value = word.split("").each_with_index.map do |letter, index|
      letter_values[letter.upcase] * letter_multipliers[index]
    end
    word_value.reduce(:+) * multiplier + (bonus * multiplier)
  end

end
