require 'jwt'

module CoreNutrition
  module Models
    module Oauth
      class Token

        # Returns an instance of the Oauth Token
        #
        # @params attributes [Hash]
        #
        # @return [CoreNutrition::Models::Oauth::Token]
        def initialize(attributes={})
          @attributes = Hash(attributes)
        end

        def self.refresh(token, params={})
          request = CoreNutrition::Requests::Oauth::Token.refresh(token, params)

          request.on(:success) do |resp|
            response_body = resp.body

            return self.new(response_body)
          end

          request.on(:failure) do |resp|
            response_body = resp.body

            error = CoreNutrition::Models::Oauth::Error.new(response_body)

            return nil
          end
        end

        def self.create(params={})
          request = CoreNutrition::Requests::Oauth::Token.create(params)

          request.on(:success) do |resp|
            response_body = resp.body

            return self.new(response_body)
          end

          request.on(:failure) do |resp|
            response_body = resp.body

            error = CoreNutrition::Models::Oauth::Error.new(response_body)

            return nil
          end
        end

        def self.retrieve(token, params={})
          request = CoreNutrition::Requests::Oauth::Token.retrieve(token, params)

          request.on(:success) do |resp|
            response_body = resp.body

            return self.new(response_body)
          end

          request.on(:failure) do |resp|
            response_body = resp.body

            error = CoreNutrition::Models::Oauth::Error.new(response_body)

            return nil
          end
        end

        def self.revoke(token, params={})
          request = CoreNutrition::Requests::Oauth::Token.revoke(token, params)

          request.on(:success) do |resp|
            response_body = resp.body

            return nil
          end

          request.on(:failure) do |resp|
            response_body = resp.body

            error = CoreNutrition::Models::Oauth::Error.new(response_body)

            return nil
          end
        end

        def token_type
          @attributes['token_type']
        end

        def access_token
          @attributes['access_token']
        end
        alias token access_token

        # Returns the JWT decoded
        #
        # @return [Hash]
        def jwt
          JWT.decode(self.access_token, ENV['CORE_CLIENT_SECRET'], true, { algorithm: 'HS256' })
        end

        def retrieve
          self.class.retrieve(self.access_token)
        end

        def revoke
          self.class.revoke(self.access_token)
        end

        def refresh_token
          @attributes['refresh_token']
        end

        def expires_in
          @attributes['expires_in'].to_i
        end

        def expires
          !self.expires_in.nil?
        end
        alias expires? expires
        alias does_expire? expires

        def expires_at
          (self.created_at.to_time + self.expires_in)
        end

        def scope
          @attributes.fetch('scope', [])
        end

        def auth_profile
          CoreNutrition::Models::Auth::Profile.retrieve
        end

        # Retun the record attributes
        #
        # @return [Hash]
        def to_attributes
          @attributes
        end

        # Returns the created at timestamp
        #
        # @return [DateTime,NilClass]
        def created_at
          begin
            DateTime.parse(@attributes['created_at'])
          rescue
            nil
          end
        end

      end
    end
  end
end
