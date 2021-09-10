module CoreNutrition
  module Models
    class NutritionalValue
      include Comparable

      # Returns an instance of the NutritionalValue
      #
      # @param attributes [Hash]
      #
      # @return [CoreNutrition::Models::NutritionalValue]
      def initialize(attributes={})
        @attributes = attributes
      end

      # Returns the name
      #
      # @return [String]
      def name
        @attributes['name']
      end

      def value
        @attributes['value']
      end

      def unit_name
        @attributes['unit_name']
      end

      def unit_type
        @attributes['unit_type']
      end

      def unit_attributes
        @attributes.fetch('unit', {})
      end

      def unit
        CoreNutrition::Models::Unit.new(self.unit_attributes)
      end
    end
  end
end
