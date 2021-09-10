module CoreNutrition
  module Models
    class NutritionalValues
      include Enumerable

      # Return an instance of the nutrition plans
      #
      # @param collection [Array]
      #
      # @return [CoreNutrition::Models::NutritionalValues]
      def initialize(collection)
        @collection = Array(collection)
      end

      def each(&block)
        internal_collection.each(&block)
      end

      # Returns the collection serialized as an array
      #
      # @return [Array]
      def to_a
        self.map(&:to_a)
      end

      private
      def internal_collection
        @collection.map { |record| CoreNutrition::Models::NutritionalValue.new(record) }
      end
    end
  end
end

