module CoreNutrition
  module Requests
    class Health

      def self.retrieve(params={})
        rel   = CoreNutrition::Client.rel_for('rels/health')
        route = CoreNutrition::Client.routes.find_by_rel(rel)
        url   = route.url_for

        request = CoreNutrition::Client.connection.get do |req|
          req.url(url)
          req.headers.delete('authorization')
          req.headers['Accept'] = 'application/json'
        end

        CoreNutrition::Response.new(request)
      end
    end
  end
end
