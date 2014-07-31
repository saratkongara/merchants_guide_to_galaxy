module IntergalacticMoneyCalculator
  module DomainLayer
    class RomanNumeralValidator
      def validate(roman_numeral: nil)
        return false if roman_numeral.nil?

        @numeral_string = roman_numeral.numeral_string
        @valid = true

        check_for_violation_of_repetition_rules
        check_for_violation_of_subtraction_rules
        valid
      end

      private

      attr_reader :numeral_string, :valid

      def check_for_violation_of_repetition_rules
        check_for_repeated_occurrences_of_d_l_or_v
        check_if_i_x_c_or_m_are_repeated_more_than_thrice
      end

      def check_for_violation_of_subtraction_rules
        check_if_i_is_followed_by_incorrect_symbol
        check_if_x_is_followed_by_incorrect_symbol
        check_if_c_is_followed_by_incorrect_symbol
        check_if_v_is_followed_by_incorrect_symbol
        check_if_l_is_followed_by_incorrect_symbol
        check_if_d_is_followed_by_incorrect_symbol
        # check_if_a_large_value_symbol_is_preceeded_by_two_small_value_symbols
      end

      def check_for_repeated_occurrences_of_d_l_or_v
        @valid = false if valid && numeral_string =~ /[DLV]{2,}/
      end

      def check_if_i_x_c_or_m_are_repeated_more_than_thrice
        @valid = false if valid && numeral_string =~ /(I{4,}|X{4,}|C{4,}|M{4,})/
      end

      def check_if_i_is_followed_by_incorrect_symbol
        @valid = false if valid && numeral_string =~ /I[^IVX]/
      end

      def check_if_x_is_followed_by_incorrect_symbol
        @valid = false if valid && numeral_string =~ /X[^IVXLC]/
      end

      def check_if_c_is_followed_by_incorrect_symbol
        @valid = false if valid && numeral_string =~ /C[^IVXLCDM]/
      end

      def check_if_v_is_followed_by_incorrect_symbol
        @valid = false if valid && numeral_string =~ /V[^I]/
      end

      def check_if_l_is_followed_by_incorrect_symbol
        @valid = false if valid && numeral_string =~ /L[^IVX]/
      end

      def check_if_d_is_followed_by_incorrect_symbol
        @valid = false if valid && numeral_string =~ /D[^IVXLC]/
      end

      def check_if_a_large_value_symbol_is_preceeded_by_two_small_value_symbols
        @valid = false if valid && numeral_string =~ /[I]{2,}V/
      end
    end
  end
end
