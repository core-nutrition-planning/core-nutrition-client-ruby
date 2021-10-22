module CoreNutrition
  module Requests
    class Directory

      def self.retrieve(params={})
        root_url = '/'
        request  = CoreNutrition::Client.connection.get do |req|
          req.url(root_url)
        end

        CoreNutrition::Response.new(request)
      end
    end
  end
end
