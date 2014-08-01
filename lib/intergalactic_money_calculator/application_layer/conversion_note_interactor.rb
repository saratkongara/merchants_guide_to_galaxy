require_relative '../domain_layer/intergalactic_symbol'
require_relative '../domain_layer/intergalactic_to_roman_numeral_converter'
require_relative '../domain_layer/commodity'

module IntergalacticMoneyCalculator
  module ApplicationLayer
    class ConversionNoteInteractor
      include IntergalacticMoneyCalculator::DomainLayer

      attr_reader :request_model

      def initialize(request_model: nil)
        @request_model = request_model
      end

      def execute
        conversion_note = request_model.note
        response_model = ConversionNoteResponseModel.new(success: false)

        if (match_data = /^([a-z]+) is ([I|V|X|L|C|D|M])$/.match(conversion_note))
          IntergalacticSymbol.create(name: match_data.captures[0], roman_numeral: match_data.captures[1])
          response_model = ConversionNoteResponseModel.new(success: true)
        elsif (match_data = /^(.*) is (\d+) Credits$/.match(conversion_note))
          response_model = ConversionNoteResponseModel.new(success: true) if processed_credits_conversion_note?(match_data.captures)
        end

        response_model
      end

      def processed_credits_conversion_note?(captures)
        components = captures[0].chomp.split(' ')
        credits = captures[1]

        if components.size >= 2 && components.last =~ /^[A-Z]/
          create_commodity_from_intergalactic_units_and_credits(components, credits)
          true
        else
          false
        end
      end

      def create_commodity_from_intergalactic_units_and_credits(components, credits)
        intergalactic_to_roman_numeral_converter = IntergalacticToRomanNumeralConverter.new

        components[0..-2].each do |intergalactic_unit|
          symbol = IntergalacticSymbol.for(name: intergalactic_unit)
          intergalactic_to_roman_numeral_converter.append(intergalactic_symbol: symbol)
        end

        roman_numeral = RomanNumeral.new(numeral_string: intergalactic_to_roman_numeral_converter.roman_numeral)
        Commodity.create(name: components.last, credit_conversion_ratio: credits.to_f / roman_numeral.arabic_value)
      end
    end
  end
end
