module CoreNutrition
  module Models
    module Planner
      class Event

        def initialize(attributes={})
          @attributes = Hash(attributes)
        end

        def self.retrieve(nutrition_plan_id, params={})
          CoreNutrition::Models::Planner::Events.retrieve(nutrition_plan_id, params)
        end

        def self.update(nutrition_plan_id, params={})
          CoreNutrition::Models::Planner::Events.update(nutrition_plan_id, params)
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

        def event_goal_id
          @attributes['event_goal_id']
        end

        def event_goal
        end

        def event_goal?
          !self.event_goal.nil?
        end

        def name
          @attributes['name']
        end

        def temperature_value
          @attributes['temperature_value']
        end

        def temperature_unit_value
          @attributes['temperature_unit']
        end

        def temperature_unit
          begin
            CoreNutrition::Models::Unit.new(self.temperature_unit_value)
          rescue ArgumentError
            nil
          end
        end

        def temperature_unit?
          !self.temperature_unit.nil?
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
