module CoreNutrition
  module Models
    module Auth
      class ForgotPassword

        def initialize(attributes={})
          @attributes = Hash(attributes)
        end

        def token
          @attributes['token']
        end

        def email_address
          @attributes['email_address']
        end

        def user_id
          @attributes['user_id']
        end

        # Returns the links attributes
        #
        # @return [Array]
        def links_attributes
          @attributes.fetch('links', [])
        end

        # Returns the Links
        #
        # @return [CoreNutrition::Models::Links]
        def links
          @links ||= CoreNutrition::Models::Links.new(self.links_attributes)
        end

        # Returns true if there are any links
        #
        # @return [Boolean]
        def links?
          self.links.any?
        end

        def to_attributes
          @attributes
        end
      end
    end
  end
end
