module CoreNutrition
  module Requests
    module Auth
      class ForgotPasswords

        def self.create(params={})
          rel   = CoreNutrition::Client.rel_for('rels/auth-forgot-password')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for

          default_params = {
            :client_id     => params.fetch(:client_id, CoreNutrition::Client.client_id),
            :client_secret => params.fetch(:client_secret, CoreNutrition::Client.client_secret),
          }

          request_body = default_params.merge!(params.slice(:client_id, :client_secret, :email_address))

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
