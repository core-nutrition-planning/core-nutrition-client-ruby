module CoreNutrition
  module Models
    module Auth
      class ResetPasswords
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def self.create(params={})
          request = CoreNutrition::Requests::Auth::ResetPasswords.create(params)

          request.on(:success) do |resp|
            return CoreNutrition::Models::Auth::ResetPasswords.new(resp.data_attributes)
          end

          request.on(:failure) do |resp|
            CoreNutrition::Client.configuration.logger.error { ("Failure creating the record: %s" % [resp.status]) }

            return nil
          end
        end

        def self.retrieve(id, params={})
          request = CoreNutrition::Requests::Auth::ResetPasswords.retrieve(id, params)

          request.on(:success) do |resp|
            return CoreNutrition::Models::Auth::ResetPassword.new(resp.data_attributes)
          end

          request.on(:failure) do |resp|
            CoreNutrition::Client.configuration.logger.error { ("Failure retrieving the record: %s" % [resp.status]) }

            return nil
          end

          nil
        end

        def self.retrieve!(id, params={})
          record = self.retrieve(id, params)

          raise CoreNutrition::Errors::RecordNotFoundError.new if record.nil?

          record
        end

        def self.update(id, params={})
          request = CoreNutrition::Requests::Auth::ResetPasswords.update(id, params)

          request.on(:success) do |resp|
            return CoreNutrition::Models::Auth::ResetPassword.new(resp.data_attributes)
          end

          request.on(:failure) do |resp|
            CoreNutrition::Client.configuration.logger.error { ("Failure updating the record: %s" % [resp.status]) }

            return nil
          end

          nil
        end

        def self.update!(id, params={})
          record = self.update(id, params)

          raise CoreNutrition::Errors::RecordNotFoundError.new if record.nil?

          record
        end

        def each(&block)
          internal_collection.each(&block)
        end

        private
        def internal_collection
          @collection.map { |record| CoreNutrition::Models::Auth::ResetPassword.new(record) }
        end
      end
    end
  end
end
