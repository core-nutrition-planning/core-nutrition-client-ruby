module CoreNutrition
  module Models
    class Placements
      include Enumerable

      # Return an instance of the nutrition plans
      #
      # @param collection [Array]
      #
      # @return [CoreNutrition::Models::Placements]
      def initialize(collection)
        @collection = Array(collection)
      end

      # Helper method to retrieve from the
      # request
      #
      # @param params [Hash]
      #
      # @return [CoreNutrition::Models::Placements]
      def self.list_by_nutrition_plan_id(nutrition_plan_id, params={})
        request = CoreNutrition::Requests::Placements.list_by_nutrition_plan_id(nutrition_plan_id, params)

        klass_attributes = []

        request.on(:success) do |resp|
          klass_attributes = resp.data_attributes
        end

        request.on(:failure) do |resp|
          CoreNutrition::Client.configuration.logger.error { ("Failure retrieving the placements: %s" % [resp.status]) }
        end

        self.new(klass_attributes)
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
        @collection.map { |record| CoreNutrition::Models::Placement.new(record) }
      end
    end
  end
end

