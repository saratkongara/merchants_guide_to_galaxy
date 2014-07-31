require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module DomainLayer
    class RomanNumeralTest < Minitest::Test
      include IntergalacticMoneyCalculator::DomainLayer

      def test_arabic_value_of_roman_numeral_with_one_digit
        roman_numeral = RomanNumeral.new(numeral_string: 'L')

        assert_equal 50, roman_numeral.arabic_value
      end

      def test_arabic_value_with_two_digits_returns_the_correct_value
        roman_numeral = RomanNumeral.new(numeral_string: 'XV')

        assert_equal 15, roman_numeral.arabic_value
      end

      def test_arabic_value_of_roman_numeral_with_in_order_digits_is_correct
        roman_numeral = RomanNumeral.new(numeral_string: 'LXVI')

        assert_equal 66, roman_numeral.arabic_value
      end

      def test_arabic_value_of_roman_numeral_for_44_returns_the_correct_value
        roman_numeral = RomanNumeral.new(numeral_string: 'XLIV')

        assert_equal 44, roman_numeral.arabic_value
      end

      def test_arabic_value_of_roman_numeral_for_1944_returns_the_correct_value
        roman_numeral = RomanNumeral.new(numeral_string: 'MCMXLIV')

        assert_equal 1944, roman_numeral.arabic_value
      end

      def test_valid_returns_true_for_correct_roman_numeral
        roman_numeral = RomanNumeral.new(numeral_string: 'CCCLXXXVIII')

        assert roman_numeral.valid?
      end

      def test_valid_returns_false_for_incorrect_roman_numeral
        roman_numeral = RomanNumeral.new(numeral_string: 'LCM')

        refute roman_numeral.valid?
      end
    end
  end
end
