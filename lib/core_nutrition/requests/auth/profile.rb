module CoreNutrition
  module Requests
    module Auth
      class Profile
        def self.retrieve(params={})
          rel   = CoreNutrition::Client.rel_for('rels/auth-profile')
          route = CoreNutrition::Client.routes.find_by_rel(rel)
          url   = route.url_for(params)

          request = CoreNutrition::Client.connection.get do |req|
            req.url(url)
            req.headers['Accept'] = 'application/json'
          end

          CoreNutrition::Response.new(request)
        end
        def initialize(attributes={})
          @attributes = attributes
        end

        def id
          @attributes['id']
        end

        def type
          @attributes['type']
        end

        def first_name
          @attributes['first_name']
        end

        def last_name
          @attributes['last_name']
        end

        def full_name
          [self.first_name, self.last_name].compact.join(' ')
        end

        def email
          @attributes['email']
        end
      end
    end
  end
end
