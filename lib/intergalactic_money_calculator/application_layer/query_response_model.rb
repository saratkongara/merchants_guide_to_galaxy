module IntergalacticMoneyCalculator
  module ApplicationLayer
    class QueryResponseModel
      attr_reader :answer

      def initialize(answer: nil)
        @answer = answer
      end
    end
  end
end
