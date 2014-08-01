require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module DomainLayer
    class IntergalacticSymbolTest < Minitest::Test
      include IntergalacticMoneyCalculator::DomainLayer

      def setup
        @glob = IntergalacticSymbol.create(name: 'glob', roman_numeral: 'I')
        @prok = IntergalacticSymbol.create(name: 'prok', roman_numeral: 'V')
      end

      def test_include_returns_the_correct_boolean_value
        assert IntergalacticSymbol.include?(name: 'prok')
        refute IntergalacticSymbol.include?(name: 'blah')
      end

      def test_for_returns_the_appropriate_symbol_object
        intergalactic_symbol = IntergalacticSymbol.for(name: 'prok')
        assert_equal 'prok', intergalactic_symbol.name
        assert_equal 'V', intergalactic_symbol.roman_numeral
      end

      def teardown
        IntergalacticSymbol.remove_all
      end

      private

      attr_reader :glob, :prok
    end
  end
end
