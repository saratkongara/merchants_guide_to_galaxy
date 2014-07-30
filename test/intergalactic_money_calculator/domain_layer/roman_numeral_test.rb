require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module DomainLayer
    class RomanNumeralTest < Minitest::Test
      include IntergalacticMoneyCalculator::DomainLayer

      def setup
        @roman_numeral = RomanNumeral.new
        @glob = IntergalacticSymbol.create(name: 'glob', roman_numeral: 'I')
        @prok = IntergalacticSymbol.create(name: 'prok', roman_numeral: 'V')
        @pish = IntergalacticSymbol.create(name: 'pish', roman_numeral: 'X')
        @tegj = IntergalacticSymbol.create(name: 'tegj', roman_numeral: 'L')
      end

      def test_new_returns_a_non_nil_object
        refute_nil roman_numeral
      end

      def test_append_increments_the_length_of_roman_numeral
        roman_numeral.append(intergalactic_symbol: pish)
        roman_numeral.append(intergalactic_symbol: prok)
        roman_numeral.append(intergalactic_symbol: glob)

        assert_equal 3, roman_numeral.length
      end

      def test_to_s_returns_the_correct_roman_numeral_representation
        roman_numeral.append(intergalactic_symbol: prok)
        roman_numeral.append(intergalactic_symbol: glob)

        assert_equal 'VI', roman_numeral.to_s
      end

      def test_arabic_value_of_roman_numeral_with_one_digit
        roman_numeral.append(intergalactic_symbol: tegj)

        assert_equal 50, roman_numeral.arabic_value
      end

      def test_arabic_value_with_two_digits_returns_the_correct_value
        roman_numeral.append(intergalactic_symbol: pish)
        roman_numeral.append(intergalactic_symbol: prok)

        assert_equal 15, roman_numeral.arabic_value
      end

      def test_arabic_value_of_roman_numeral_with_in_order_digits_is_correct
        roman_numeral.append(intergalactic_symbol: tegj)
        roman_numeral.append(intergalactic_symbol: pish)
        roman_numeral.append(intergalactic_symbol: prok)
        roman_numeral.append(intergalactic_symbol: glob)

        assert_equal 66, roman_numeral.arabic_value
      end

      def test_arabic_value_of_roman_numeral_for_44_returns_the_correct_value
        roman_numeral.append(intergalactic_symbol: pish)
        roman_numeral.append(intergalactic_symbol: tegj)
        roman_numeral.append(intergalactic_symbol: glob)
        roman_numeral.append(intergalactic_symbol: prok)

        assert_equal 44, roman_numeral.arabic_value
      end

      def test_arabic_value_of_roman_numeral_for_14_returns_the_correct_value
        roman_numeral.append(intergalactic_symbol: pish)
        roman_numeral.append(intergalactic_symbol: glob)
        roman_numeral.append(intergalactic_symbol: prok)

        assert_equal 14, roman_numeral.arabic_value
      end

      private

      attr_reader :roman_numeral, :tegj, :pish, :prok, :glob
    end
  end
end
