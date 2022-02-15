module CoreNutrition
  module Models
    module Auth
      class Provider
        include Comparable

        def initialize(attributes={})
          @attributes = Hash(attributes)
        end

        def self.retrieve(id, params={})
          request = CoreNutrition::Requests::Auth::Providers.retrieve(id, params)

          request.on(:success) do |resp|
            response_body = resp.body
            response_data = response_body.fetch('data', {})

            return self.new(response_data)
          end

          request.on(:failure) do |resp|
            response_body = resp.body
            response_data = response_body.fetch('data', {})

            error = CoreNutrition::Models::Error.new(response_data)

            error.errors.each { |error_item| @errors.push(error_item.message) }

            nil
          end
        end

        def id
          @attributes['id']
        end

        def name
          @attributes['name']
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

        def authorize_link_rel
          CoreNutrition::Client.rel_for('rels/auth-provider-authorize')
        end

        def authorize_link
          self.links.find_by_rel(self.authorize_link_rel)
        end

        def authorize_link?
          !self.authorize_link.nil?
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
