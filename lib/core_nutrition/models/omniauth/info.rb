module CoreNutrition
  module Models
    module Omniauth
      class Info

        # Returns an instance of the Omniauth Info
        #
        # @params attributes [Hash]
        #
        # @return [CoreNutrition::Models::Omniauth::Info]
        def initialize(attributes={})
          @attributes = attributes
        end

        # Returns the ID
        #
        # @return [String]
        def id
          @attributes['id']
        end

        # Returns the type of the profile
        #
        # @return [String]
        def type
          @attributes['type']
        end

        # Returns the name
        #
        # @return [String]
        def name
          @attributes['name']
        end

        # Returns the first name
        #
        # @return [String]
        def first_name
          @attributes['first_name']
        end

        # Returns the last name
        #
        # @return [String]
        def last_name
          @attributes['last_name']
        end

        # Returns the full name
        #
        # @return [String]
        def full_name
          [self.first_name, self.last_name].compact.join(' ')
        end

        # Returns the email address
        #
        # @return [String]
        def email
          @attributes['email']
        end

        # Returns the created at value
        #
        # @return [String]
        def created_at_value
          @attributes['created_at']
        end

        # Returns the created at timestamp
        #
        # @return [DateTime]
        def created_at
          begin
            DateTime.parse(self.created_at_value)
          rescue
            nil
          end
        end

        # Returns the updated at value
        #
        # @return [String]
        def updated_at_value
          @attributes['updated_at']
        end

        # Returns the updated at timestamp
        #
        # @return [DateTime]
        def updated_at
          begin
            DateTime.parse(self.updated_at_value)
          rescue
            nil
          end
        end

        # Returns the links attributes
        #
        # @return [Array]
        def links_attributes
          @attributes.fetch('links', [])
        end

        # Returns the Links
        #
        # @return [Naas::Models::Links]
        def links
          @links ||= CoreNutrition::Models::Links.new(self.links_attributes)
        end

        # Returns true if there are any links
        #
        # @return [Boolean]
        def links?
          self.links.any?
        end
      end
    end
  end
end
