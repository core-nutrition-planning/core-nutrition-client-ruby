module CoreNutrition
  module Models
    module Auth
      class Providers
        include Enumerable

        # Return an instance of the nutrition plans
        #
        # @param collection [Array]
        #
        # @return [CoreNutrition::Models::NutritionPlans]
        def initialize(collection)
          @collection = Array(collection)
        end

        # Helper to retrieve the headings collection
        #
        # @return [Array]
        def self.headings
          COLUMNS
        end

        # Helper method to retrieve from the
        # request
        #
        # @param params [Hash]
        #
        # @return [CoreNutrition::Models::NutritionPlans]
        def self.list(params={})
          request = CoreNutrition::Requests::Auth::Providers.list(params)

          klass_attributes = []

          request.on(:success) do |resp|
            klass_attributes = resp.data_attributes
          end

          request.on(:failure) do |resp|
            CoreNutrition::Client.configuration.logger.error { ("Failure retrieving the auth providers: %s" % [resp.status]) }
          end

          self.new(klass_attributes)
        end

        # Helper method to retrieve from the request
        #
        # @param id [String]
        # @param params [Hash]
        #
        # @return [CoreNutrition::Models::NutritionPlan]
        def self.retrieve(id, params={})
          request = CoreNutrition::Requests::Auth::Providers.retrieve(id, params)

          request.on(:success) do |resp|
            return CoreNutrition::Models::Auth::Provider.new(resp.data_attributes)
          end

          request.on(:failure) do |resp|
            CoreNutrition::Client.configuration.logger.error { ("Failure retrieving the auth provider: %s" % [resp.status]) }

            return nil
          end
        end

        # Retrieve the model from the request
        #
        # @param id [String]
        # @param params [Hash]
        #
        # @raises [CoreNutrition::Errors::RecordNotFoundError]
        #
        # @return [CoreNutrition::Models::NutritionPlan]
        def self.retrieve!(id, params={})
          request = CoreNutrition::Requests::Auth::Providers.retrieve(id, params)

          request.on(:success) do |resp|
            return CoreNutrition::Models::Auth::Provider.new(resp.data_attributes)
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
          @collection.map { |record| CoreNutrition::Models::Auth::Provider.new(record) }
        end
      end
    end
  end
end
