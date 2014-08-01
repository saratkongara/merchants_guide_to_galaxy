require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module ApplicationLayer
    class QueryRequestModelTest < Minitest::Test
      include IntergalacticMoneyCalculator::ApplicationLayer

      def test_question_returns_the_correct_query
        query_request_model = QueryRequestModel.new(question: 'how much is pish tegj glob glob ?')

        assert_equal 'how much is pish tegj glob glob ?', query_request_model.question
      end
    end
  end
end
