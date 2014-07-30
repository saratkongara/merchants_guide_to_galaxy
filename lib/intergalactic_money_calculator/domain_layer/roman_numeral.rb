module IntergalacticMoneyCalculator
  module DomainLayer
    class RomanNumeral
      @sorted_symbols = %w{I V X L C D M}
      @symbol_to_value_map = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50,
                               'C' => 100, 'D' => 500, 'M' => 1000 }

      class << self
        attr_reader :sorted_symbols, :symbol_to_value_map
      end

      def initialize(numeral_string: nil)
        @numeral_string = numeral_string
      end

      def arabic_value
        calculate_arabic_value numeral_string
      end

      private

      attr_reader :numeral_string

      def calculate_arabic_value(roman_numeral)
        case roman_numeral.length
        when 1
          value_for_one_digit_numeral(roman_numeral)
        when 2
          value_for_two_digits_numeral(roman_numeral[0], roman_numeral[1])
        else
          value_for_three_and_more_digits_numeral(roman_numeral[0], roman_numeral[1], roman_numeral[2..-1])
        end
      end

      def first_digit_less_than_second_digit?(first_digit, second_digit)
        RomanNumeral.sorted_symbols.index(first_digit) < RomanNumeral.sorted_symbols.index(second_digit)
      end

      def subtract_first_digit_numeral_value_from_second_digit(first_digit, second_digit)
        value_for_one_digit_numeral(second_digit) - value_for_one_digit_numeral(first_digit)
      end

      def value_for_one_digit_numeral(roman_digit)
        RomanNumeral.symbol_to_value_map[roman_digit]
      end

      def value_for_two_digits_numeral(first_digit, second_digit)
        if first_digit_less_than_second_digit?(first_digit, second_digit)
          subtract_first_digit_numeral_value_from_second_digit(first_digit, second_digit)
        else
          value_for_one_digit_numeral(first_digit) + value_for_one_digit_numeral(second_digit)
        end
      end

      def value_for_three_and_more_digits_numeral(first_digit, second_digit, remaining_numeral)
        if first_digit_less_than_second_digit?(first_digit, second_digit)
          value_for_two_digits_numeral(first_digit, second_digit) + calculate_arabic_value(remaining_numeral)
        else
          value_for_one_digit_numeral(first_digit) + calculate_arabic_value(second_digit + remaining_numeral)
        end
      end
    end
  end
end
