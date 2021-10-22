module CoreNutrition
  module Models
    class UserPreference
      include Comparable

      # Returns an instance of the UserPreference
      #
      # @param attributes [Hash]
      #
      # @return [CoreNutrition::Models::UserPreference]
      def initialize(attributes={})
        @attributes = Hash(attributes)
      end

      # Returns the ID
      #
      # @return [Integer]
      def system_of_measurement
        @attributes['system_of_measurement']
      end

      # Returns the created at timestamp
      #
      # @return [DateTime,NilClass]
      def created_at
        begin
          DateTime.parse(@attributes['created_at'])
        rescue
          nil
        end
      end

      # Returns the updated at timestamp
      #
      # @return [DateTime,NilClass]
      def updated_at
        begin
          DateTime.parse(@attributes['updated_at'])
        rescue
          nil
        end
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
        [self.system_of_measurement, self.created_at]
      end

      # Returns as attributes
      #
      # @return [Hash]
      def to_attributes
        @attributes
      end
    end
  end
end
