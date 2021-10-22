module CoreNutrition
  module Requests
    class UserPreferences
      # Retrieve the instance of a user profile
      #
      # @param params [Hash]
      #
      # @return [CoreNutrition::Response]
      def self.retrieve(params={})

        rel   = CoreNutrition::Client.rel_for('rels/user-preferences')
        route = CoreNutrition::Client.routes.find_by_rel(rel)
        url   = route.url_for(params)

        request = CoreNutrition::Client.connection.get do |req|
          req.url(url)
        end

        CoreNutrition::Response.new(request)
      end

      def self.update(params={})
        rel   = CoreNutrition::Client.rel_for('rels/user-preferences')
        route = CoreNutrition::Client.routes.find_by_rel(rel)
        url   = route.url_for(params)

        request_body = params

        request = CoreNutrition::Client.connection.put do |req|
          req.url(url)
          req.headers['Content-Type'] = 'application/json'
          req.body = MultiJson.dump(request_body)
        end

        CoreNutrition::Response.new(request)
      end
    end
  end
end

