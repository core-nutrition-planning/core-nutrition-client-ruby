module CoreNutrition
  module Models
    class Placement
      include Comparable

      # Returns an instance of the Placement
      #
      # @param attributes [Hash]
      #
      # @return [CoreNutrition::Models::Placement]
      def initialize(attributes={})
        @attributes = attributes
      end

      # Returns the ID
      #
      # @return [Integer]
      def id
        @attributes['id']
      end

      def nutrition_plan_id
        @attributes['nutrition_plan_id']
      end

      def event_segment_id
        @attributes['event_segment_id']
      end

      def segment_name
        @attributes['segment_name']
      end

      def category_name
        @attributes['category_name']
      end

      def form_name
        @attributes['form_name']
      end

      def flavor_name
        @attributes['flavor_name']
      end

      def ingredients
        @attributes['ingredients']
      end

      def distance_value
        @attributes['distance']
      end

      def quantity
        @attributes['quantity']
      end

      def nutritional_values_attributes
        @attributes.fetch('nutritional_values', [])
      end

      def nutritional_values
        CoreNutrition::Models::NutritionalValues.new(self.nutritional_values_attributes)
      end

      def nutritional_values?
        self.nutritional_values.any?
      end
    end
  end
end
