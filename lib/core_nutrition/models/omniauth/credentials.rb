require 'jwt'

module CoreNutrition
  module Models
    module Omniauth
      class Credentials

        # Returns an instance of the Omniauth Credentials
        #
        # @params attributes [Hash]
        #
        # @return [CoreNutrition::Models::Omniauth::Credentials]
        def initialize(attributes={})
          @attributes = attributes
        end

        # Returns the token
        #
        # @return [String]
        def token
          @attributes['token']
        end
        alias access_token token

        # Returns the JWT decoded
        #
        # @return [Hash]
        def jwt
          JWT.decode(self.token, ENV['CORE_CLIENT_SECRET'], true, { algorithm: 'HS256' })
        end

        # Returns the refresh token
        #
        # @return [String]
        def refresh_token
          @attributes['refresh_token']
        end

        # Returns the expires at value
        #
        # @return [Integer] UNIX timestamp
        def expires_at_value
          @attributes['expires_at']
        end

        # Returns th eexpires at
        #
        # @return [Time]
        def expires_at
          Time.at(self.expires_at_value)
        end

        # Returns true if this expires
        #
        # @return [Boolean]
        def expires
          @attributes['expires']
        end
        alias expires? expires
        alias does_expire? expires
      end
    end
  end
end
