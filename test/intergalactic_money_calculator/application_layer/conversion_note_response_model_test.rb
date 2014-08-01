require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module ApplicationLayer
    class ConversionNoteResponseModelTest < Minitest::Test
      include IntergalacticMoneyCalculator::ApplicationLayer

      def test_message_returns_the_correct_conversion_note
        conversion_note_response_model = ConversionNoteResponseModel.new(success: true)

        assert_equal true, conversion_note_response_model.success?
      end
    end
  end
end
