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

      def test_arabic_value_of_roman_numeral_for_14_returns_the_correct_value
        roman_numeral = RomanNumeral.new(numeral_string: 'XIV')

        assert_equal 14, roman_numeral.arabic_value
      end
    end
  end
end
