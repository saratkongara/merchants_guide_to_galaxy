require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module DomainLayer
    class IntergalacticSymbolToRomanNumeralMapperTest < Minitest::Test
      include IntergalacticMoneyCalculator::DomainLayer

      def test_new_returns_a_non_nil_object
        refute_nil IntergalacticSymbolToRomanNumeralMapper.new
      end
    end
  end
end
