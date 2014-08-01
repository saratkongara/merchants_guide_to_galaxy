require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module ApplicationLayer
    class QueryResponseModelTest < Minitest::Test
      include IntergalacticMoneyCalculator::ApplicationLayer

      def test_answer_returns_the_correct_response
        query_response_model = QueryResponseModel.new(answer: 'pish tegj glob glob is 42')

        assert_equal 'pish tegj glob glob is 42', query_response_model.answer
      end
    end
  end
end
