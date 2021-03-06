module CoreNutrition
  module Serializers
    module Json
      class DataTableColumn
        def initialize(attributes={})
          @attributes = attributes
        end

        def index
          @attributes[:index].to_i
        end

        def id
          @attributes['id']
        end

        def label
          @attributes['label']
        end

        def type
          @attributes['type']
        end
      end
    end
  end
end
