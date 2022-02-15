module CoreNutrition
  module Models
    class NutritionPlan
      include Comparable

      # Returns an instance of the NutritionPlan
      #
      # @param attributes [Hash]
      #
      # @return [CoreNutrition::Models::NutritionPlan]
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

      def planner_profile
        @planner_profile ||= CoreNutrition::Models::Planner::Profiles.retrieve(self.id)
      end

      def planner_profile?
        !self.planner_profile.nil?
      end

      def planner_event
        @planner_event ||= CoreNutrition::Models::Planner::Events.retrieve(self.id)
      end

      def planner_event?
        !self.planner_event.nil?
      end

      # Returns the Event ID
      #
      # @return [Integer]
      def event_id
        @attributes['event_id']
      end

      # Returns the event model
      #
      # @return [CoreNutrition::Models::Event]
      def event
        @event ||= CoreNutrition::Models::Events.retrieve(self.event_id)
      end

      def placements(params={})
        @placements ||= CoreNutrition::Models::Placements.list_by_nutrition_plan_id(self.id, params)
      end

      def placements?
        self.placements.any?
      end

      # Returns true if there is an event
      #
      # @return [Boolean]
      def event?
        !self.event.nil?
      end

      # Returns the name
      #
      # @return [String]
      def name
        @attributes['name']
      end

      # Returns the event name
      #
      # @return [String]
      def event_name
        @attributes['event_name']
      end

      # Returns the goal name
      #
      # @return [String]
      def goal_name
        @attributes['goal_name']
      end

      # Returns the hydration preference value
      #
      # @return [Float]
      def hydration_preference_percent_value
        @attributes['hydration_preference_percent']
      end

      # Returns the hydration preference percent
      #
      # @return [Float]
      def hydration_preference_percent
        (self.hydration_preference_percent_value * 100.0)
      end

      # Returns the water preference value
      #
      # @return [Float]
      def water_preference_percent_value
        @attributes['water_preference_percent']
      end

      # Returns the water preference percent
      #
      # @return [Float]
      def water_preference_percent
        (self.water_preference_percent_value * 100.0)
      end

      # Returns the sweat rate value
      #
      # @return [String]
      def sweat_rate_value
        @attributes['sweat_rate_value']
      end

      # Returns the sweat rate category name
      #
      # @return [String]
      def sweat_rate_category_name
        @attributes['sweat_rate_category_name']
      end

      # Returns the sweat rate unit attributes
      #
      # @return [Hash]
      def sweat_rate_unit_attributes
        @attributes['sweat_rate_unit']
      end

      # Returns the sweat rate unit
      #
      # @return [CoreNutrition::Models::Unit]
      def sweat_rate_unit
        begin
          CoreNutrition::Models::Unit.new(self.sweat_rate_unit_attributes)
        rescue ArgumentError
          nil
        end
      end

      # Returns true if there is a sweat rate unit
      #
      # @return [Boolean]
      def sweat_rate_unit?
        !self.sweat_rate_unit.nil?
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

      # Returns the seconds duration
      #
      # @return [integer]
      def seconds_duration
        @attributes.fetch('seconds_duration', 0)
      end

      # Returns the expected duration name
      #
      # @return [String]
      def duration_name
        Time.at(self.seconds_duration).utc.strftime("%H:%M:%S")
      end

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

      # Returns the end at value
      #
      # @return [String, NilClass]
      def end_at_value
        @attributes['end_at']
      end

      # Returns the end at timestamp
      #
      # @return [DateTime,NilClass]
      def end_at
        begin
          DateTime.parse(@attributes['end_at'])
        rescue
          nil
        end
      end

      # Returns true if there is a end time
      #
      # @return [DateTime,NilClass]
      def end_at?
        !self.end_at.nil?
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

