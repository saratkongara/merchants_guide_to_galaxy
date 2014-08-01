module IntergalacticMoneyCalculator
  module ApplicationLayer
    class ConversionNoteRequestModel
      attr_reader :note

      def initialize(note: nil)
        @note = note
      end
    end
  end
end
