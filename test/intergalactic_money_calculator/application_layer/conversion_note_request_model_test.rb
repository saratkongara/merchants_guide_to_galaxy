require File.join(File.dirname(__FILE__), '/../../test_helper')

module IntergalacticMoneyCalculator
  module ApplicationLayer
    class ConversionNoteRequestModelTest < Minitest::Test
      include IntergalacticMoneyCalculator::ApplicationLayer

      def test_note_returns_the_correct_conversion_note
        conversion_note_request_model = ConversionNoteRequestModel.new(note: 'glob glob Silver is 34 Credits')

        assert_equal 'glob glob Silver is 34 Credits', conversion_note_request_model.note
      end
    end
  end
end
