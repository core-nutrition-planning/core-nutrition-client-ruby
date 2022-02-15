module CoreNutrition
  module Requests
    module Auth
      class Providers
        def self.list(params={})
          rel   = CoreNutrition::Client.rel_for('rels/auth-providers')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(params)

          request = CoreNutrition::Client.connection.get do |req|
            req.url(url)
            req.headers['Accept'] = 'application/json'
          end

          CoreNutrition::Response.new(request)
        end

        def self.retrieve(id, params={})
          rel   = CoreNutrition::Client.rel_for('rels/auth-provider')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(params.merge!(id: id))

          request = CoreNutrition::Client.connection.get do |req|
            req.url(url)
            req.headers['Accept'] = 'application/json'
          end

          CoreNutrition::Response.new(request)
        end

        def self.authorize(id, params={})
          rel   = CoreNutrition::Client.rel_for('rels/auth-provider-authorize')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(params.merge!(id: id))

          default_params = {
            :client_id     => params.fetch(:client_id, CoreNutrition::Client.client_id),
            :client_secret => params.fetch(:client_secret, CoreNutrition::Client.client_secret),
          }

          request_body = default_params.merge!(params.slice(:client_id, :client_secret, :redirect_uri))

          request = CoreNutrition::Client.connection.post do |req|
            req.url(url)
            req.headers['Accept'] = 'application/json'
            req.body = MultiJson.dump(request_body)
          end

          CoreNutrition::Response.new(request)
        end
      end
    end
  end
end
