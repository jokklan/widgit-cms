module Widgit
  module Components
    class Icon < Component
      # Extensions
      hstore_accessor :properties, {
                        icon: :string,
                        font_size: :integer,
                        text_align: :integer
                      }
      configurable icon: {
                    data_type: :icon,
                    input_type: :string
                  },
                  font_size: {
                    data_type: :font_size,
                    input_type: :slider,
                    default_value: 2
                  },
                  text_align: {
                    data_type: :text_align,
                    input_type: :slider,
                    default_value: 2
                  }

      def public_attributes
        properties.symbolize_keys.slice(:icon, :font_size, :text_align)
          .merge(type: component_type)
          .merge(id: id).compact
      end

      def component_type
        type.split('::').last
      end
    end
  end
end
