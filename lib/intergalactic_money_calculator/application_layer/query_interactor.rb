require_relative '../domain_layer/intergalactic_symbol'
require_relative '../domain_layer/intergalactic_to_roman_numeral_converter'
require_relative '../domain_layer/commodity'

module IntergalacticMoneyCalculator
  module ApplicationLayer
    class QueryInteractor
      include IntergalacticMoneyCalculator::DomainLayer

      attr_reader :request_model

      def initialize(request_model: nil)
        @request_model = request_model
      end

      def execute
        query, money = request_model.question, nil

        if (match_data = /^how much is (.*)\?$/.match(query))
          money = money_from_intergalactic_units(match_data.captures.first.chomp(' ').split(' '))
        elsif (match_data = /^how many Credits is (.*)\?$/.match(query))
          money = money_from_intergalactic_units_with_commodity(match_data.captures.first.chomp.split(' '))
        end

        money ? QueryResponseModel.new(answer: "#{match_data.captures.first.chomp(' ')} is #{money.to_s}") :
                QueryResponseModel.new(answer: 'I have no idea what you are talking about')
      end

      def money_from_intergalactic_units(components)
        roman_numeral = roman_numeral_from_intergalactic_units(components)
        Money.new(amount: roman_numeral)
      end

      def money_from_intergalactic_units_with_commodity(components)
        roman_numeral = roman_numeral_from_intergalactic_units(components[0..-2])
        commodity = Commodity.for(name: components.last)
        Money.new(amount: roman_numeral, commodity: commodity)
      end

      def roman_numeral_from_intergalactic_units(components)
        intergalactic_to_roman_numeral_converter = IntergalacticToRomanNumeralConverter.new

        components.each do |intergalactic_unit|
          symbol = IntergalacticSymbol.for(name: intergalactic_unit)
          intergalactic_to_roman_numeral_converter.append(intergalactic_symbol: symbol)
        end

        RomanNumeral.new(numeral_string: intergalactic_to_roman_numeral_converter.roman_numeral)
      end
    end
  end
end
