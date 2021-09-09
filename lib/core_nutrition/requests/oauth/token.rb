module CoreNutrition
  module Requests
    module Oauth
      class Token

        def self.authorize(params={})
        end

        def self.refresh(token, params={})
          rel   = CoreNutrition::Client.rel_for('rels/oauth-token')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(params)

          default_params = {
            :client_id     => params.fetch(:client_id, CoreNutrition::Client.client_id),
            :client_secret => params.fetch(:client_secret, CoreNutrition::Client.client_secret),
            :grant_type    => 'refresh_token',
            :refresh_token => token
          }

          request_params = default_params.merge!(params.slice(:client_id, :client_secret))

          request = CoreNutrition::Client.connection.post do |req|
            req.url(url)
            req.headers.delete('Authorization')
            req.headers['Accept'] = 'application/json'
            req.body = MultiJson.dump(request_params)
          end

          CoreNutrition::Response.new(request)
        end

        def self.create(params={})
          rel   = CoreNutrition::Client.rel_for('rels/oauth-token')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(params)

          default_params = {
            :client_id     => params.fetch(:client_id, CoreNutrition::Client.client_id),
            :client_secret => params.fetch(:client_secret, CoreNutrition::Client.client_secret),
          }

          request_params = default_params.merge!(params)

          request = CoreNutrition::Client.connection.post do |req|
            req.url(url)
            req.headers.delete('Authorization')
            req.headers['Accept'] = 'application/json'
            req.body = MultiJson.dump(request_params)
          end

          CoreNutrition::Response.new(request)
        end

        def self.retrieve(token, params={})
          rel   = CoreNutrition::Client.rel_for('rels/oauth-token-info')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(params)

          default_params = {
            :client_id     => params.fetch(:client_id, CoreNutrition::Client.client_id),
            :client_secret => params.fetch(:client_secret, CoreNutrition::Client.client_secret),
            :token         => token
          }

          request_params = default_params.merge!(params)

          request = CoreNutrition::Client.connection.post do |req|
            req.url(url)
            req.headers.delete('Authorization')
            req.headers['Accept'] = 'application/json'
            req.body = MultiJson.dump(request_params)
          end

          CoreNutrition::Response.new(request)
        end

        def self.revoke(token, params={})
          rel   = CoreNutrition::Client.rel_for('rels/oauth-token-revoke')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(params)

          default_params = {
            :client_id     => params.fetch(:client_id, CoreNutrition::Client.client_id),
            :client_secret => params.fetch(:client_secret, CoreNutrition::Client.client_secret),
            :token         => token
          }

          request_params = default_params.merge!(params)

          request = CoreNutrition::Client.connection.post do |req|
            req.url(url)
            req.headers.delete('Authorization')
            req.headers['Accept'] = 'application/json'
            req.body = MultiJson.dump(request_params)
          end

          CoreNutrition::Response.new(request)
        end
      end
    end
  end
end
