require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module DomainLayer
    class MoneyTest < Minitest::Test
      include IntergalacticMoneyCalculator::DomainLayer

      def setup
        @iron = Commodity.create(name: 'Iron', credit_conversion_ratio: 195.5)
      end

      def test_to_s_returns_the_correct_result_for_money_with_no_commodity
        amount = RomanNumeral.new(numeral_string: 'XLII')
        money = Money.new(amount: amount)

        assert_equal '42', money.to_s
      end

      def test_to_s_returns_the_correct_result_for_money_with_commodity
        amount = RomanNumeral.new(numeral_string: 'XX')
        money = Money.new(amount: amount, commodity: iron)

        assert_equal '3910 Credits', money.to_s
      end

      def teardown
        Commodity.remove_all
      end

      private

      attr_reader :iron
    end
  end
end
