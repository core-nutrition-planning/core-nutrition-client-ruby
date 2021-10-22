module CoreNutrition
  module Models
    class PlacementNutritionalValues
      include Enumerable

      # Return an instance of the nutrition plans
      #
      # @param collection [Array]
      #
      # @return [CoreNutrition::Models::NutritionalValues]
      def initialize(collection)
        @collection = Array(collection)
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

      def find_by_name(name)
        self.find { |r| r.name == name.to_s }
      end

      def summary_attributes
        self.group_by { |r| [r.name, r.unit_type] }.map do |key,values|
          name         = key[0]
          first_record = values.first

          record = {
            'name'      => name,
            'quantity'  => values.sum(&:quantity),
            'dosage'    => values.sum(&:dosage),
            'value'     => values.sum(&:value),
            'unit_name' => first_record.unit_name,
            'unit_type' => first_record.unit_type,
            'unit'      => first_record.unit_attributes
          }
          record
        end
      end

      def summary
        CoreNutrition::Models::PlacementNutritionalValues.new(self.summary_attributes)
      end

      private
      def internal_collection
        @collection.map { |record| CoreNutrition::Models::PlacementNutritionalValue.new(record) }
      end
    end
  end
end

