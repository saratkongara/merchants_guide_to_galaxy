module IntergalacticMoneyCalculator
  module DomainLayer
    class Commodity
      @mapping_table ||= {}

      class << self
          attr_reader :mapping_table
      end

      attr_reader :name, :credit_conversion_ratio

      def self.create(name: nil, credit_conversion_ratio: nil)
        mapping_table[name] = new(name, credit_conversion_ratio)
      end

      def self.for(name: nil)
        mapping_table[name]
      end

      def self.include?(name: nil)
        mapping_table.include? name
      end

      def self.remove_all
        mapping_table.clear
      end

      private

      def initialize(name, credit_conversion_ratio)
        @name, @credit_conversion_ratio = name, credit_conversion_ratio
      end
    end
  end
end
