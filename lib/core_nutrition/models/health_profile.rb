module CoreNutrition
  module Models
    class HealthProfile
      include Comparable

      # Returns an instance of the HealthProfile
      #
      # @param attributes [Hash]
      #
      # @return [CoreNutrition::Models::HealthProfile]
      def initialize(attributes={})
        @attributes = attributes
      end

      def update(attributes={})
        CoreNutrition::Models::HealthProfiles.update(attributes)
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

      # Returns true if restricting carb intake
      #
      # @return [Boolean]
      def is_restricting_carb_intake
        @attributes['is_restricting_carb_intake']
      end
      alias restricting_carb_intake? is_restricting_carb_intake
      alias is_restricting_carb_intabke? is_restricting_carb_intake

      # Returns true if has weight loss focus
      #
      # @return [Boolean]
      def has_weight_loss_focus
        @attributes['has_weight_loss_focus']
      end
      alias has_weight_loss_focus? has_weight_loss_focus
      alias weight_loss_focus? has_weight_loss_focus

      # Returns the height value
      #
      # @return [String]
      def height_value
        @attributes['height_value']
      end

      # Returns the height unit attributes
      #
      # @return [Hash]
      def height_unit_attributes
        @attributes['height_unit']
      end

      # Returns the height unit
      #
      # @return [CoreNutrition::Models::Unit]
      def height_unit
        begin
          CoreNutrition::Models::Unit.new(self.height_unit_attributes)
        rescue ArgumentError
          nil
        end
      end

      # Returns true if there is a height unit
      #
      # @return [Boolean]
      def height_unit?
        !self.height_unit.nil?
      end

      # Returns the weight value
      #
      # @return [String]
      def weight_value
        @attributes['weight_value']
      end

      # Returns the weight unit attributes
      #
      # @return [Hash]
      def weight_unit_attributes
        @attributes['weight_unit']
      end

      # Returns the weight unit
      #
      # @return [CoreNutrition::Models::Unit]
      def weight_unit
        begin
          CoreNutrition::Models::Unit.new(self.weight_unit_attributes)
        rescue ArgumentError
          nil
        end
      end

      # Returns true if there is a weight unit
      #
      # @return [Boolean]
      def weight_unit?
        !self.weight_unit.nil?
      end

      # Returns the sweat rate category value
      #
      # @return [String]
      def sweat_rate_category_value
        @attributes['sweat_rate_category_value']
      end

      # Returns the carbohydrate training frequency value
      #
      # @return [String]
      def carbohydrate_training_frequency_category_value
        @attributes['carbohydrate_training_frequency_category_value']
      end

      # Returns the caffeine sensitivity category name
      #
      # @return [String]
      def caffeine_sensitivity_category_name
        @attributes['caffeine_sensitivity_category_name']
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
