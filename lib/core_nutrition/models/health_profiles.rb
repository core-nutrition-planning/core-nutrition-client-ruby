module CoreNutrition
  module Models
    class HealthProfiles
      include Enumerable

      # Return an instance of the nutrition plans
      #
      # @param collection [Array]
      #
      # @return [CoreNutrition::Models::HealthProfiles]
      def initialize(collection)
        @collection = Array(collection)
      end

      # Helper method to retrieve from the request
      #
      # @param params [Hash]
      #
      # @return [CoreNutrition::Models::HealthProfile]
      def self.retrieve(params={})
        request = CoreNutrition::Requests::HealthProfiles.retrieve(params)

        request.on(:success) do |resp|
          return CoreNutrition::Models::HealthProfile.new(resp.data_attributes)
        end

        request.on(:failure) do |resp|
          CoreNutrition::Client.configuration.logger.error { ("Failure retrieving the health profile: %s" % [resp.status]) }

          return nil
        end
      end

      # Retrieve the model from the request
      #
      # @param params [Hash]
      #
      # @raises [CoreNutrition::Errors::RecordNotFoundError]
      #
      # @return [CoreNutrition::Models::HealthProfile]
      def self.retrieve!(params={})
        request = CoreNutrition::Requests::HealthProfiles.retrieve(params)

        request.on(:success) do |resp|
          return CoreNutrition::Models::HealthProfile.new(resp.data_attributes)
        end

        request.on(404) do
          raise CoreNutrition::Errors::RecordNotFoundError.new("Could not find record with id: %s" % [id])
        end
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
        @collection.map { |record| CoreNutrition::Models::HealthProfile.new(record) }
      end
    end
  end
end

