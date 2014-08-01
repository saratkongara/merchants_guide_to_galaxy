require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module ApplicationLayer
    class ConversionNoteInteractorTest < Minitest::Test
      include IntergalacticMoneyCalculator::ApplicationLayer

      def test_execute_returns_true_for_intergalactic_unit_to_roman_numeral_conversion_note
        request_model = ConversionNoteRequestModel.new(note: 'tegj is L')
        interactor = ConversionNoteInteractor.new(request_model: request_model)
        response_model = interactor.execute

        assert response_model.success?
      end

      def test_execute_returns_true_for_intergalactic_unit_with_commodity_to_roman_numeral_conversion_note
        request_model = ConversionNoteRequestModel.new(note: 'glob is I')
        interactor = ConversionNoteInteractor.new(request_model: request_model)
        interactor.execute

        request_model = ConversionNoteRequestModel.new(note: 'prok is V')
        interactor = ConversionNoteInteractor.new(request_model: request_model)
        interactor.execute

        request_model = ConversionNoteRequestModel.new(note: 'glob prok Gold is 57800 Credits')
        interactor = ConversionNoteInteractor.new(request_model: request_model)
        response_model = interactor.execute

        assert response_model.success?
      end

      def test_execute_returns_false_for_conversion_note_with_incorrect_roman_numeral
        request_model = ConversionNoteRequestModel.new(note: 'prok is VL')
        interactor = ConversionNoteInteractor.new(request_model: request_model)
        response_model = interactor.execute

        refute response_model.success?
      end

      def test_execute_returns_false_for_conversion_note_with_no_commodity_and_credits
        request_model = ConversionNoteRequestModel.new(note: 'glob prok tegj is 57800 Credits')
        interactor = ConversionNoteInteractor.new(request_model: request_model)
        response_model = interactor.execute

        refute response_model.success?
      end

      def test_execute_returns_false_for_conversion_note_with_commodity_and_no_credits
        request_model = ConversionNoteRequestModel.new(note: 'glob prok Gold is 500')
        interactor = ConversionNoteInteractor.new(request_model: request_model)
        response_model = interactor.execute

        refute response_model.success?
      end
    end
  end
end
