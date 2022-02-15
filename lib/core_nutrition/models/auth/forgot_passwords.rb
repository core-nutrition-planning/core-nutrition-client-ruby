module CoreNutrition
  module Models
    module Auth
      class ForgotPasswords
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def self.create(params={})
          request = CoreNutrition::Requests::Auth::ForgotPasswords.create(params)

          request.on(:success) do |resp|
            return CoreNutrition::Models::Auth::ForgotPassword.new(resp.data_attributes)
          end

          request.on(404) do
            raise CoreNutrition::Errors::RecordNotFoundError.new("Could not find record with id: %s" % [id])
          end
        end

        def each(&block)
          internal_collection.each(&block)
        end

        private
        def internal_collection
          @collection.map { |record| CoreNutrition::Models::Auth::ForgotPassword.new(record) }
        end
      end
    end
  end
end
