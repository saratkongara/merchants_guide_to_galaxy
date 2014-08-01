require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module ApplicationLayer
    class QueryInteractorTest < Minitest::Test
      include IntergalacticMoneyCalculator::ApplicationLayer
      include IntergalacticMoneyCalculator::DomainLayer

      def setup
        process_conversion_note('glob is I')
        process_conversion_note('prok is V')
        process_conversion_note('pish is X')
        process_conversion_note('tegj is L')
        process_conversion_note('glob glob Silver is 34 Credits')
        process_conversion_note('glob prok Gold is 57800 Credits')
        process_conversion_note('pish pish Iron is 3910 Credits')
      end

      def test_execute_returns_the_correct_response_for_valid_how_much_query
        request_model = QueryRequestModel.new(question: 'how much is pish tegj glob glob ?')
        interactor = QueryInteractor.new(request_model: request_model)
        response_model = interactor.execute

        assert_equal 'pish tegj glob glob is 42', response_model.answer
      end

      def test_execute_returns_the_correct_response_for_valid_how_many_credits_query
        request_model = QueryRequestModel.new(question: 'how many Credits is glob prok Iron ?')
        interactor = QueryInteractor.new(request_model: request_model)
        response_model = interactor.execute

        assert_equal 'glob prok Iron is 782 Credits', response_model.answer
      end

      def teardown
        IntergalacticSymbol.remove_all
        Commodity.remove_all
      end

      private

      def process_conversion_note(note)
        request_model = ConversionNoteRequestModel.new(note: note)
        interactor = ConversionNoteInteractor.new(request_model: request_model)
        interactor.execute
      end
    end
  end
end
