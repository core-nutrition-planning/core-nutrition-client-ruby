module CoreNutrition
  module Models
    class SystemOfMeasurement
      include Comparable

      # Returns an instance of the System of Measurement
      #
      # @param attributes [Hash]
      #
      # @return [CoreNutrition::Models::SystemOfMeasurement]
      def initialize(attributes={})
        @attributes = attributes
      end

      # Returns the ID
      #
      # @return [Integer]
      def id
        @attributes['id']
      end

      def name
        @attributes['name']
      end

      # Returns the links attributes
      #
      # @return [Array]
      def links_attributes
        @attributes.fetch('links', [])
      end

      # Returns the Links
      #
      # @return [CoreNutrition::Models::Links]
      def links
        @links ||= CoreNutrition::Models::Links.new(self.links_attributes)
      end

      # Returns true if there are any links
      #
      # @return [Boolean]
      def links?
        self.links.any?
      end

      # Returns the record as an array
      #
      # @return [Array]
      def to_a
        [self.id, self.name]
      end

      def to_attributes
        @attributes
      end

      def to_option
        [self.id, self.name]
      end
    end
  end
end
