module CoreNutrition
  module Models
    module Auth
      class ResetPassword
        def initialize(attributes={})
          @attributes = attributes
        end

        def token
          @attributes['token']
        end

        def email_address
          @attributes['email_address']
        end
      end
    end
  end
end
