require File.expand_path('../data_table_rows', __FILE__)
require File.expand_path('../data_table_columns', __FILE__)

module CoreNutrition
  module Serializers
    module Json
      class DataTable
        def initialize(attributes={})
          @attributes = attributes
        end

        def rows_attributes
          @attributes.fetch('rows', [])
        end

        def rows
          @rows ||= CoreNutrition::Serializers::Json::DataTableRows.new(self.rows_attributes)
        end

        def cols_attributes
          @attributes.fetch('cols', [])
        end
        alias columns_attributes cols_attributes

        def cols
          @cols ||= CoreNutrition::Serializers::Json::DataTableColumns.new(self.columns_attributes)
        end
        alias columns cols
      end
    end
  end
end
