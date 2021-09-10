module CoreNutrition
  module Models
    class Event
      include Comparable

      # Returns an instance of the Event
      #
      # @param attributes [Hash]
      #
      # @return [CoreNutrition::Models::Event]
      def initialize(attributes={})
        @attributes = attributes
      end

      # Returns the ID
      #
      # @return [Integer]
      def id
        @attributes['id']
      end

      # Returns the unit of measure id
      #
      # @return [Integer]
      def unit_of_measure_id
        @attributes['unit_of_measure_id']
      end

      # Returns the unit of measure name
      #
      # @return [String]
      def unit_of_measure_value
        @attributes['unit_of_measure_value']
      end
      alias unit_of_measure_name unit_of_measure_value

      # Returns the user type name
      #
      # @return [String]
      def user_type_name
        @attributes['user_type_name']
      end

      # Returns the type name
      #
      # @return [String]
      def type_name
        @attributes['type_name']
      end

      # Returns the sub type name
      #
      # @return [String]
      def sub_type_name
        @attributes['sub_type_name']
      end

      # Returns the name
      #
      # @return [String]
      def name
        @attributes['name']
      end

      # Returns the city
      #
      # @return [String]
      def city
        @attributes['city']
      end

      # Returns the state
      #
      # @return [String]
      def state
        @attributes['state']
      end

      # Returns the country
      #
      # @return [String]
      def country
        @attributes['country']
      end

      # Returns the latitude
      #
      # @return [Float,NilClass]
      def latitude
        @attributes['latitude']
      end

      # Returns true if there is a latitude
      #
      # @return [Boolean]
      def latitude?
        !self.latitude.nil?
      end

      # Returns the longitude
      #
      # @return [Float,NilClass]
      def longitude
        @attributes['longitude']
      end

      # Returns true if there is a longitude
      #
      # @return [Boolean]
      def longitude?
        !self.longitude.nil?
      end

      # Returns the url value
      #
      # @return [String,NilClass]
      def url_value
        @attributes['url']
      end

      def uri
        URI(self.url_value.to_s)
      end

      def url
        if uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
          self.uri
        end
      end

      def url?
        !self.url.nil?
      end

      # Returns the temperature value
      #
      # @return [String]
      def temperature_value
        @attributes['temperature_value']
      end

      # Returns the temperature unit attributes
      #
      # @return [Hash]
      def temperature_unit_attributes
        @attributes['temperature_unit']
      end

      # Returns the temperature unit
      #
      # @return [CoreNutrition::Models::Unit]
      def temperature_unit
        begin
          CoreNutrition::Models::Unit.new(self.temperature_unit_attributes)
        rescue ArgumentError
          nil
        end
      end

      # Returns true if there is a temeprature unit
      #
      # @return [Boolean]
      def temperature_unit?
        !self.temperature_unit.nil?
      end

      # Returns true if user defined
      #
      # @return [Boolean]
      def is_user_defined
        @attributes['is_user_defined']
      end
      alias user_defined? is_user_defined
      alias is_user_defined? is_user_defined

      def is_generic
        @attributes['is_generic']
      end
      alias generic? is_generic
      alias is_generic? is_generic

      # Returns the start at value
      #
      # @return [String, NilClass]
      def start_at_value
        @attributes['start_at']
      end

      # Returns the start at timestamp
      #
      # @return [DateTime,NilClass]
      def start_at
        begin
          DateTime.parse(@attributes['start_at'])
        rescue
          nil
        end
      end

      # Returns true if there is a start time
      #
      # @return [DateTime,NilClass]
      def start_at?
        !self.start_at.nil?
      end

      # Returns the start at time zone value
      #
      # @return [String,NilClass]
      def start_at_timezone_value
        @attributes['start_at_timezone']
      end

      # Returns the start at timezone record
      #
      # @return [Timezone,NilClass]
      def start_at_timezone_record
        Timezone[self.start_at_timezone_value]
      end

      # Returns the date value
      #
      # @return [String]
      def date_value
        @attributes['date']
      end

      # Returns the date
      #
      # @return [Date,NilClass]
      def date
        begin
          Date.parse(self.date_value)
        rescue nil
        end
      end

      # Returns true if there is a date
      #
      # @return [Boolean]
      def date?
        !self.date.nil?
      end


      # Returns the created at timestamp
      #
      # @return [DateTime,NilClass]
      def created_at
        begin
          DateTime.parse(@attributes['created_at'])
        rescue
          nil
        end
      end

      # Returns the updated at timestamp
      #
      # @return [DateTime,NilClass]
      def updated_at
        begin
          DateTime.parse(@attributes['updated_at'])
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
    end
  end
end
