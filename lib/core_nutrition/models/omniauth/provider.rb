module CoreNutrition
  module Models
    module Omniauth
      class Provider

        # Returns an instance of the Omniauth Provider
        #
        # @params attributes [Hash]
        #
        # @return [CoreNutrition::Models::Omniauth::Provider]
        def initialize(attributes={})
          @attributes = Hash(attributes)
        end

        # Returns the provider name
        #
        # @return [String]
        def provider
          @attributes['provider']
        end

        # Returns the provider uid
        #
        # @return [String]
        def uid
          @attributes['uid']
        end

        # Returns the info attributes
        #
        # @return [Hash]
        def info_attributes
          @attributes.fetch('info', {})
        end

        # Returns an instance of the omniauth info
        #
        # @return [CoreNutrition::Models::Omniauth::Info]
        def info
          CoreNutrition::Models::Omniauth::Info.new(self.info_attributes)
        end

        # Returns the credentials attributes
        #
        # @return [Hash]
        def credentials_attributes
          @attributes.fetch('credentials', {})
        end

        # Returns an instance of the omniauth credentials
        #
        # @return [CoreNutrition::Models::Omniauth::Credentials]
        def credentials
          CoreNutrition::Models::Omniauth::Credentials.new(self.credentials_attributes)
        end

        def to_attributes
          @attributes
        end
      end
    end
  end
end
