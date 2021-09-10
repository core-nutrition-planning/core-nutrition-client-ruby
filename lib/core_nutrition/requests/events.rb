module CoreNutrition
  module Requests
    class Events

      # Retrieve the instance of an event
      #
      # @param id [Integer]
      # @param params [Hash]
      #
      # @return [CoreNutrition::Response]
      def self.retrieve(id, params={})
        raise CoreNutrition::Errors::InvalidArgumentError.new("id must be provided") if id.nil?

        rel   = CoreNutrition::Client.rel_for('rels/event')
        route = CoreNutrition::Client.routes.find_by_rel(rel)
        url   = route.url_for(params.merge!(id: id.to_s))

        request = CoreNutrition::Client.connection.get do |req|
          req.url(url)
          req.headers['Accept'] = 'application/vnd.core+json; version=1'
        end

        CoreNutrition::Response.new(request)
      end
    end
  end
end

