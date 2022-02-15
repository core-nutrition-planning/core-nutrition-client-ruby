module CoreNutrition
  module Models
    module Planner
      class Profile

        def initialize(attributes={})
          @attributes = Hash(attributes)
        end

        def self.retrieve(nutrition_plan_id, params={})
          CoreNutrition::Models::Planner::Profiles.retrieve(nutrition_plan_id, params)
        end

        def self.update(nutrition_plan_id, params={})
          CoreNutrition::Models::Planner::Profiles.update(nutrition_plan_id, params)
        end

        def nutrition_plan_id
          @attributes['nutrition_plan_id']
        end

        def nutrition_plan
          @nutrition_plan ||= CoreNutrition::Models::NutritionPlans.retrieve(self.nutrition_plan_id)
        end

        def nutrition_plan?
          !self.nutrition_plan.nil?
        end

        def user_id
          @attributes['user_id']
        end

        def event_id
          @attributes['event_id']
        end

        def event
          @event ||= CoreNutrition::Models::Events.retrieve(self.event_id)
        end

        def event?
          !self.event.nil?
        end

        def caffeine_sensitivity_category_id
          @attributes['caffeine_sensitivity_category_id']
        end

        def caffeine_sensitivity_category
          @caffeine_sensitivity_category ||= CoreNutrition::Models::CaffeineSensitivityCategories.retrieve(self.caffeine_sensitivity_category_id)
        end

        def caffeine_sensitivity_category?
          !self.caffeine_sensitivity_category.nil?
        end

        def carbohydrate_training_frequency_category_id
          @attributes['carbohydrate_training_frequency_category_id']
        end

        def carbohydrate_training_frequency_category
          @carbohydrate_training_frequency_category ||= CoreNutrition::Models::CarbohydrateTrainingFrequencyCategories.retrieve(self.carbohydrate_training_frequency_category_id)
        end

        def carbohydrate_training_frequency_category?
          !self.carbohydrate_training_frequency_category.nil?
        end

        def sweat_rate_category_id
          @attributes['sweat_rate_category_id']
        end

        def sweat_rate_category
          @sweat_rate_category ||= CoreNutrition::Models::SweatRateCategories.retrieve(self.sweat_rate_category_id)
        end

        def sweat_rate_category?
          !self.sweat_rate_category.nil?
        end

        def name
          @attributes['name']
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

        # Returns true if restricting carb intake
        #
        # @return [Boolean]
        def is_restricting_carb_intake
          @attributes['is_restricting_carb_intake']
        end
        alias restricting_carb_intake? is_restricting_carb_intake
        alias is_restricting_carb_intake? is_restricting_carb_intake

        # Returns true if has weight loss focus
        #
        # @return [Boolean]
        def has_weight_loss_focus
          @attributes['has_weight_loss_focus']
        end
        alias has_weight_loss_focus? has_weight_loss_focus
        alias weight_loss_focus? has_weight_loss_focus

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

        # Return the record as attributes
        #
        # @return [Hash]
        def to_attributes
          @attributes
        end
      end
    end
  end
end
