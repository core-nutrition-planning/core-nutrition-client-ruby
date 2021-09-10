module CoreNutrition
  module Requests
    class Placements

      # Retrieve the list of nutrition plans
      #
      # @param params [Hash]
      #
      # @return [CoreNutrition::Response]
      def self.list_by_nutrition_plan_id(nutrition_plan_id, params={})
        rel   = CoreNutrition::Client.rel_for('rels/nutrition-plan-placements')
        route = CoreNutrition::Client.routes.find_by_rel(rel)
        url   = route.url_for(params.merge!(nutrition_plan_id: nutrition_plan_id))

        request = CoreNutrition::Client.connection.get do |req|
          req.url(url)
          req.headers['Accept'] = 'application/vnd.core+json; version=1'
        end

        CoreNutrition::Response.new(request)
      end
    end
  end
end

