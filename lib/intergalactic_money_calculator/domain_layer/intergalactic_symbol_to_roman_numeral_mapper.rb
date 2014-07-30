module IntergalacticMoneyCalculator
  module DomainLayer
    class IntergalacticSymbolToRomanNumeralMapper
      def initialize
        @map = {}
      end

      private

      attr_accessor :map
    end
  end
end
