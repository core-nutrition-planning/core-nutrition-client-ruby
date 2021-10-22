module CoreNutrition
  module Models
    class Timezones
      include Enumerable

      def initialize(collection)
        @collection = Array(collection)
      end

      # Helper method to retrieve from the
      # request
      #
      # @param params [Hash]
      #
      # @return [CoreNutrition::Models::]
      def self.list(params={})
        default_params = {
          :page          => 1,
          :per_page      => 250,
          :auto_paginate => (params.delete(:auto_paginate) || false)
        }

        request_params = default_params.merge!(params)

        auto_paginate = request_params.delete(:auto_paginate)

        request = CoreNutrition::Requests::Timezones.list(request_params)

        request_records = []

        request.on(:success) do |resp|
          if resp.status == 200
            response_body  = resp.body
            response_links = response_body.fetch('links', [])
            response_data  = response_body.fetch('data', [])

            request_records.concat(response_data)

            links = CoreNutrition::Models::Links.new(response_links)

            next_link = links.find_by_rel('next')

            if auto_paginate && next_link
              loop do
                sub_request = CoreNutrition::Client.get(next_link.url_for)

                sub_response_body = []

                sub_request.on(:success) do |sub_resp|

                  sub_response_body = sub_resp.body
                  sub_response_data = sub_response_body.fetch('data', [])
                  sub_response_links = sub_response_body.fetch('links', [])

                  request_records.concat(sub_response_data)

                  links = CoreNutrition::Models::Links.new(sub_response_links)

                  next_link = links.find_by_rel('next')
                end

                break if next_link.nil?
              end
            end
          else
            CoreNutrition::Client.configuration.logger.error { "Failure in paginating" % [resp.status] }
          end

          return CoreNutrition::Models::Timezones.new(request_records)
        end

        request.on(:failure) do |resp|
          CoreNutrition::Client.configuration.logger.error { ("Failure retrieving the records: %s" % [resp.status]) }
        end

        self.new(request_records)
      end

      # Retrieve all options
      #
      # @note: This will retrieve all for now, but should auto paginate
      #
      # @return [Array]
      def self.options(params={})
        records = self.list(per_page: 250)
        records.options
      end

      # Helper method to retrieve from the request
      #
      # @param id [String]
      # @param params [Hash]
      #
      # @return [CoreNutrition::Models::Timezone]
      def self.retrieve(id, params={})
        request = CoreNutrition::Requests::Timezones.retrieve(id, params)

        request.on(:success) do |resp|
          return CoreNutrition::Models::Timezone.new(resp.data_attributes)
        end

        request.on(:failure) do |resp|
          CoreNutrition::Client.configuration.logger.error { ("Failure retrieving the record: %s" % [resp.status]) }

          return nil
        end
      end

      # Retrieve the model from the request
      #
      # @param id [String]
      # @param params [Hash]
      #
      # @raises [CoreNutrition::Errors::RecordNotFoundError]
      #
      # @return [CoreNutrition::Models::Timezone]
      def self.retrieve!(id, params={})
        request = CoreNutrition::Requests::Timezones.retrieve(id, params)

        request.on(:success) do |resp|
          return CoreNutrition::Models::Timezone.new(resp.data_attributes)
        end

        request.on(404) do
          raise CoreNutrition::Errors::RecordNotFoundError.new("Could not find record with id: %s" % [id])
        end
      end

      def each(&block)
        internal_collection.each(&block)
      end

      # Returns the collection serialized as an array
      #
      # @return [Array]
      def to_a
        self.map(&:to_a)
      end

      def to_option
        self.map(&:to_option)
      end
      alias to_options to_option
      alias options to_option

      private
      def internal_collection
        @collection.map { |record| CoreNutrition::Models::Timezone.new(record) }
      end
    end
  end
end

