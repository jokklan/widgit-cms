module Widgit
  module Components
    class Text < Component
      # Extensions
      hstore_accessor :properties, { text: :string, font_size: :integer }
      configurable font_size: { data_type: :font_size, input_type: :slider, default_value: 2 }
    end
  end
end
