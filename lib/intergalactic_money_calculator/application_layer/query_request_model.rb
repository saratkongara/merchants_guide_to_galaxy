module IntergalacticMoneyCalculator
  module ApplicationLayer
    class QueryRequestModel
      attr_reader :question

      def initialize(question: nil)
        @question = question
      end
    end
  end
end
