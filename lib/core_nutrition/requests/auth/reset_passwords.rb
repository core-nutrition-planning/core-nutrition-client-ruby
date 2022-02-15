module CoreNutrition
  module Requests
    module Auth
      class ResetPasswords

        def self.create(params={})
          rel   = CoreNutrition::Client.rel_for('rels/auth-reset-passwords')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for

          default_params = {
            :client_id     => params.fetch(:client_id, CoreNutrition::Client.client_id),
            :client_secret => params.fetch(:client_secret, CoreNutrition::Client.client_secret),
          }

          request_params = {
            :reset_password => default_params.merge!(params.slice(:client_id, :client_secret, :email_address))
          }

          request_body = request_params

          request = CoreNutrition::Client.connection.post do |req|
            req.url(url)
            req.headers['Accept'] = 'application/json'
            req.body = MultiJson.dump(request_body)
          end

          CoreNutrition::Response.new(request)
        end

        def self.retrieve(id, params={})
          rel   = CoreNutrition::Client.rel_for('rels/auth-reset-password')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(id: id)

          request = CoreNutrition::Client.connection.get do |req|
            req.url(url)
            req.headers['Accept'] = 'application/json'
          end

          CoreNutrition::Response.new(request)
        end

        def self.update(id, params={})
          rel   = CoreNutrition::Client.rel_for('rels/auth-reset-password')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(id: id)

          default_params = {
            :client_id     => params.fetch(:client_id, CoreNutrition::Client.client_id),
            :client_secret => params.fetch(:client_secret, CoreNutrition::Client.client_secret),
          }

          request_params = {
            :reset_password => default_params.merge!(params.slice(:client_id, :client_secret, :password, :password_confirmation))
          }

          request_body = request_params

          request = CoreNutrition::Client.connection.put do |req|
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
