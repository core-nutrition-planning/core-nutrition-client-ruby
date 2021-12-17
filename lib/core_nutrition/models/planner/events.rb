module CoreNutrition
  module Models
    module Planner
      class Events
        include Enumerable

        # Return an instance of the nutrition plans
        #
        # @param collection [Array]
        #
        # @return [CoreNutrition::Models::Planner::Events]
        def initialize(collection)
          @collection = Array(collection)
        end

        # Helper method to retrieve from the request
        #
        # @param params [Hash]
        #
        # @return [CoreNutrition::Models::Planner::Event]
        def self.retrieve(nutrition_plan_id, params={})
          request = CoreNutrition::Requests::Planner::Event.retrieve(nutrition_plan_id, params)

          request.on(:success) do |resp|
            return CoreNutrition::Models::Planner::Event.new(resp.data_attributes)
          end

          request.on(:failure) do |resp|
            CoreNutrition::Client.configuration.logger.error { ("Failure retrieving the event: %s" % [resp.status]) }

            return nil
          end
        end

        # Retrieve the model from the request
        #
        # @param params [Hash]
        #
        # @raises [CoreNutrition::Errors::RecordNotFoundError]
        #
        # @return [CoreNutrition::Models::Planner::Event]
        def self.retrieve!(nutrition_plan_id, params={})
          request = CoreNutrition::Requests::Planner::Event.retrieve(nutrition_plan_id, params)

          request.on(:success) do |resp|
            return CoreNutrition::Models::Planner::Event.new(resp.data_attributes)
          end

          request.on(404) do
            raise CoreNutrition::Errors::RecordNotFoundError.new("Could not find record with id: %s" % [id])
          end
        end

        def self.update(nutrition_plan_id, params={})
          request = CoreNutrition::Requests::Planner::Event.update(nutrition_plan_id, params)

          request.on(:success) do |resp|
            return CoreNutrition::Models::Planner::Event.new(resp.data_attributes)
          end

          request.on(:failure) do |resp|
            CoreNutrition::Client.configuration.logger.error { ("Failure updating the event: %s" % [resp.status]) }

            return nil
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
          @collection.map { |record| CoreNutrition::Models::Planner::Event.new(record) }
        end
      end
    end
  end
end
