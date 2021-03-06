require File.expand_path('../data_table_row', __FILE__)

module CoreNutrition
  module Serializers
    module Json
      class DataTableRows
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def each(&block)
          internal_collection.each(&block)
        end

        def at_column(column_number)
          self.map(&:columns).map { |r| r.at_index(column_number) }.flatten
        end

        private
        def internal_collection
          @collection.map { |record| CoreNutrition::Serializers::Json::DataTableRow.new(record) }
        end
      end
    end
  end
end
