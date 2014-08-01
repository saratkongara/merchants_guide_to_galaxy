module IntergalacticMoneyCalculator
  module ApplicationLayer
    class ConversionNoteResponseModel
      attr_reader :success

      def initialize(success: nil)
        @success = success
      end

      alias_method :success?, :success
    end
  end
end
