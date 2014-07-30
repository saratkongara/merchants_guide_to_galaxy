require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module DomainLayer
    class CurrencyTest < Minitest::Test
      include IntergalacticMoneyCalculator::DomainLayer

      def setup
        @silver = Currency.create(name: 'Silver', conversion_ratio: 17)
        @gold = Currency.create(name: 'Gold', conversion_ratio: 14_450)
      end

      def test_include_returns_the_correct_boolean_value
        assert Currency.include?(name: 'Gold')
        refute Currency.include?(name: 'Iron')
      end

      def test_for_returns_the_appropriate_currency_object
        currency = Currency.for(name: 'Silver')
        assert_equal 'Silver', currency.name
        assert_equal 17, currency.conversion_ratio
      end

      private

      attr_reader :silver, :gold
    end
  end
end
