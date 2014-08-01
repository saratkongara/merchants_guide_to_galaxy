require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module DomainLayer
    class IntergalacticToRomanNumeralConverterTest < Minitest::Test
      include IntergalacticMoneyCalculator::DomainLayer

      def setup
        @converter = IntergalacticToRomanNumeralConverter.new
        @glob = IntergalacticSymbol.create(name: 'glob', roman_numeral: 'I')
        @prok = IntergalacticSymbol.create(name: 'prok', roman_numeral: 'V')
        @pish = IntergalacticSymbol.create(name: 'pish', roman_numeral: 'X')
        @tegj = IntergalacticSymbol.create(name: 'tegj', roman_numeral: 'L')
      end

      def test_roman_numeral_for_one_intergalactic_symbol_returns_correct_value
        converter.append(intergalactic_symbol: tegj)

        assert_equal 'L', converter.roman_numeral
      end

      def test_roman_numeral_for_two_intergalactic_symbols_returns_correct_value
        converter.append(intergalactic_symbol: pish)
        converter.append(intergalactic_symbol: prok)

        assert_equal 'XV', converter.roman_numeral
      end

      def test_roman_numeral_for_three_intergalactic_symbols_returns_correct_value
        converter.append(intergalactic_symbol: pish)
        converter.append(intergalactic_symbol: glob)
        converter.append(intergalactic_symbol: prok)

        assert_equal 'XIV', converter.roman_numeral
      end

      def test_roman_numeral_for_four_intergalactic_symbols_returns_correct_value
        converter.append(intergalactic_symbol: pish)
        converter.append(intergalactic_symbol: tegj)
        converter.append(intergalactic_symbol: glob)
        converter.append(intergalactic_symbol: prok)

        assert_equal 'XLIV', converter.roman_numeral
      end

      def teardown
        IntergalacticSymbol.remove_all
      end

      private

      attr_reader :converter, :tegj, :pish, :prok, :glob
    end
  end
end
