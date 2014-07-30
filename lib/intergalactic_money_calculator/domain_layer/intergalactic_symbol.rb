module IntergalacticMoneyCalculator
  module DomainLayer
    class IntergalacticSymbol
      @mapping_table ||= {}

      class << self
          attr_accessor :mapping_table
      end

      attr_reader :name, :roman_numeral

      def self.create(name: nil, roman_numeral: nil)
        mapping_table[name] = new(name, roman_numeral)
      end

      def self.for(name: nil)
        mapping_table[name]
      end

      def self.include?(name: nil)
        mapping_table.include? name
      end

      private

      def initialize(name, roman_numeral)
        @name, @roman_numeral = name, roman_numeral
      end
    end
  end
end
