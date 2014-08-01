require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module DomainLayer
    class CommodityTest < Minitest::Test
      include IntergalacticMoneyCalculator::DomainLayer

      def setup
        @silver = Commodity.create(name: 'Silver', credit_conversion_ratio: 17)
        @gold = Commodity.create(name: 'Gold', credit_conversion_ratio: 14_450)
      end

      def test_include_returns_the_correct_boolean_value
        assert Commodity.include?(name: 'Gold')
        refute Commodity.include?(name: 'Iron')
      end

      def test_for_returns_the_appropriate_commodity_object
        commodity = Commodity.for(name: 'Silver')
        assert_equal 'Silver', commodity.name
        assert_equal 17, commodity.credit_conversion_ratio
      end

      def teardown
        Commodity.remove_all
      end

      private

      attr_reader :silver, :gold
    end
  end
end
