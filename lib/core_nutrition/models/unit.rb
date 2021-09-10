require 'ruby-units'

module CoreNutrition
  module Models
    class Unit < SimpleDelegator
      # Returns an instance of the Unit
      #
      # @param attributes [Hash]
      #
      # @return [CoreNutrition::Models::Unit]
      def initialize(attributes={})
        @attributes = attributes

        @_unit_model ||= RubyUnits::Unit.new(@attributes.fetch('base', ''))
      end

      # Returns the units value
      #
      # @return [String]
      def units_value
        @attributes['units']
      end

      # Returns the base value
      #
      # @return [String]
      def base_value
        @attributes['base']
      end

      # Returns the scalar value
      #
      # @return [Float]
      def scalar_value
        @attributes['scalar']
      end

      # Returns the base scalar value
      #
      # @return [Float]
      def base_scalar_value
        @attributes['base_scalar']
      end

      # Implement Delegator
      def __getobj__
        @_unit_model
      end
    end
  end
end
