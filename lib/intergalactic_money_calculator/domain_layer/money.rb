module IntergalacticMoneyCalculator
  module DomainLayer
    class Money
      attr_reader :amount, :commodity

      def initialize(amount: nil, commodity: nil)
        @amount, @commodity = amount, commodity
      end

      def to_s
        if commodity.nil?
          amount.arabic_value.to_s
        else
          "#{(amount.arabic_value * commodity.credit_conversion_ratio).floor} Credits"
        end
      end
    end
  end
end
