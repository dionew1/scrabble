gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_empty_string
    assert_equal 0, Scrabble.new.score("")
  end

  def test_it_can_score_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_score_a_word
    assert_equal 5, Scrabble.new.score("cat")
    assert_equal 5, Scrabble.new.score("dog")
  end

  def test_it_can_score_with_mutlipliers
    actual = Scrabble.new.score_with_mulitpliers("cat", [1,2,1])

    assert_equal 6, actual
  end

  def test_it_can_score_with_mutlipliers
    actual = Scrabble.new.score_with_mulitpliers("cat", [1,2,1])

    assert_equal 6, actual
  end

  def test_it_can_score_with_mutlipliers_and_multiplier
    actual = Scrabble.new.score_with_mulitpliers("cat", [1,2,1], 2)

    assert_equal 12, actual
  end

  def test_greater_than_7_bonus
    actual = Scrabble.new.greater_than_7_bonus('sparkle')

    assert_equal 10, actual
  end

  def test_it_can_score_with_mutlipliers_and_7_letter_word
    actual = Scrabble.new.score_with_mulitpliers('sparkle', [1,2,1,3,1,2,1], 2)

    assert_equal 58, actual
  end


end
