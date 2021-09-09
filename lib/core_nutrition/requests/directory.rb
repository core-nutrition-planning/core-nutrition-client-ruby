module CoreNutrition
  module Requests
    class Directory

      def self.retrieve(params={})
        root_url = '/'
        request  = CoreNutrition::Client.connection.get do |req|
          req.url(root_url)
          req.headers['Accept'] = 'application/vnd.core_nutrition.json; version=1'
        end

        CoreNutrition::Response.new(request)
      end
    end
  end
end
