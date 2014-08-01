require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module DomainLayer
    class RomanNumeralValidatorTest < Minitest::Test
      include IntergalacticMoneyCalculator::DomainLayer

      def setup
        @validator = RomanNumeralValidator.new
      end

      def test_validation_fails_for_roman_numeral_with_d_l_v_repeated
        roman_numeral = RomanNumeral.new(numeral_string: 'LLC')
        refute validator.validate(roman_numeral: roman_numeral)
      end

      def test_validation_fails_for_roman_numeral_with_i_x_c_m_repeated_more_than_thrice
        roman_numeral = RomanNumeral.new(numeral_string: 'XXXXI')
        refute validator.validate(roman_numeral: roman_numeral)
      end

      def test_validation_fails_for_roman_numeral_with_i_followed_by_incorrect_literal
        roman_numeral = RomanNumeral.new(numeral_string: 'IL')
        refute validator.validate(roman_numeral: roman_numeral)
      end

      def test_validation_fails_for_roman_numeral_with_x_followed_by_incorrect_literal
        roman_numeral = RomanNumeral.new(numeral_string: 'XD')
        refute validator.validate(roman_numeral: roman_numeral)
      end

      def test_validation_fails_for_roman_numeral_with_c_followed_by_incorrect_literal
        roman_numeral = RomanNumeral.new(numeral_string: 'CS')
        refute validator.validate(roman_numeral: roman_numeral)
      end

      def test_validation_fails_for_roman_numeral_with_v_followed_by_incorrect_literal
        roman_numeral = RomanNumeral.new(numeral_string: 'VX')
        refute validator.validate(roman_numeral: roman_numeral)
      end

      def test_validation_fails_for_roman_numeral_with_l_followed_by_incorrect_literal
        roman_numeral = RomanNumeral.new(numeral_string: 'LC')
        refute validator.validate(roman_numeral: roman_numeral)
      end

      def test_validation_fails_for_roman_numeral_with_d_followed_by_incorrect_literal
        roman_numeral = RomanNumeral.new(numeral_string: 'DM')
        refute validator.validate(roman_numeral: roman_numeral)
      end

      def test_validation_fails_for_roman_numeral_with_large_value_symbol_preceeded_by_two_small_value_symbols
        roman_numeral = RomanNumeral.new(numeral_string: 'IIV')
        refute validator.validate(roman_numeral: roman_numeral)
      end

      private

      attr_reader :validator
    end
  end
end
