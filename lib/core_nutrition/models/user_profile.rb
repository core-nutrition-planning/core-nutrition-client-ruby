module CoreNutrition
  module Models
    class UserProfile
      include Comparable

      # Returns an instance of the UserProfile
      #
      # @param attributes [Hash]
      #
      # @return [CoreNutrition::Models::UserProfile]
      def initialize(attributes={})
        @attributes = attributes
      end

      # Returns the ID
      #
      # @return [Integer]
      def id
        @attributes['id']
      end

      # Returns the User ID
      #
      # @return [Integer]
      def user_id
        @attributes['user_id']
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

      # Returns the email
      #
      # @return [String]
      def email
        @attributes['email']
      end

      # Returns the gender
      #
      # @return [String]
      def gender
        @attributes['gender']
      end

      # Returns the city name
      #
      # @return [String]
      def city
        @attributes['city']
      end

      # Returns the state name
      #
      # @return [String]
      def state
        @attributes['state']
      end

      # Returns the country name
      #
      # @return [String]
      def country
        @attributes['country']
      end

      # Returns the unit of measure name
      #
      # @return [String]
      def unit_of_measure_name
        @attributes['unit_of_measure_name']
      end

      # Returns the birth date value
      #
      # @return [String,NilClass]
      def birth_date_value
        @attributes['birth_date']
      end

      # Returns the birth date
      #
      # @return [Date,NilClass]
      def birth_date
        begin
          Date.parse(self.birth_date_value)
        rescue
          nil
        end
      end

      # Returns true if there is a birth date
      #
      # @return [Boolean]
      def birth_date?
        !self.birth_date.nil?
      end

      # Returns the age
      #
      # @return [String]
      def age(since = Time.now.utc)
        return nil unless self.birth_date?

        now = since.to_date
        now.year - self.birth_date.year - ((now.month > self.birth_date.month || (now.month == self.birth_date.month && now.day >= self.birth_date.day)) ? 0 : 1)
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

      # Returns the record as an array
      #
      # @return [Array]
      def to_a
        [self.id, self.name, self.created_at]
      end
    end
  end
end
