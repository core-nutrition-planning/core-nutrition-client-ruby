module CoreNutrition
  module Requests
    module Planner
      class Event
        # Retrieve the instance of a nutrition planner event
        #
        # @param nutrition_plan_id [Integer]
        # @param params [Hash]
        #
        # @return [CoreNutrition::Response]
        def self.retrieve(nutrition_plan_id, params={})
          raise CoreNutrition::Errors::InvalidArgumentError.new("nutrition_plan_id must be provided") if nutrition_plan_id.nil?

          rel   = CoreNutrition::Client.rel_for('rels/nutrition-planner-event')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(params.merge!(nutrition_plan_id: nutrition_plan_id.to_s))

          request = CoreNutrition::Client.connection.get do |req|
            req.url(url)
          end

          CoreNutrition::Response.new(request)
        end

        def self.update(nutrition_plan_id, params={})
          rel   = CoreNutrition::Client.rel_for('rels/nutrition-planner-event')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(params.merge!(nutrition_plan_id: nutrition_plan_id.to_s))

          request_body = params

          request = CoreNutrition::Client.connection.patch do |req|
            req.url(url)
            req.headers['Content-Type'] = 'application/json'
            req.body = MultiJson.dump(request_body)
          end

          CoreNutrition::Response.new(request)
        end
      end
    end
  end
end
