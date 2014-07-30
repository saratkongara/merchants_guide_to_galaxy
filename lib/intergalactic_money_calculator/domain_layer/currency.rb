module IntergalacticMoneyCalculator
  module DomainLayer
    class Currency
      @mapping_table ||= {}

      class << self
          attr_reader :mapping_table
      end

      attr_reader :name, :conversion_ratio

      def self.create(name: nil, conversion_ratio: nil)
        mapping_table[name] = new(name, conversion_ratio)
      end

      def self.for(name: nil)
        mapping_table[name]
      end

      def self.include?(name: nil)
        mapping_table.include? name
      end

      private

      def initialize(name, conversion_ratio)
        @name, @conversion_ratio = name, conversion_ratio
      end
    end
  end
end
