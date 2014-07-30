module IntergalacticMoneyCalculator
  module DomainLayer
    class IntergalacticToRomanNumeralConverter
      def initialize
        @intergalactic_symbols = []
      end

      def append(intergalactic_symbol: nil)
        intergalactic_symbols << intergalactic_symbol
      end

      def roman_numeral
        intergalactic_symbols.reduce('') do |string_representation, intergalactic_symbol|
          string_representation + intergalactic_symbol.roman_numeral
        end
      end

      private

      attr_reader :intergalactic_symbols
    end
  end
end
