module Widgit
  module Components
    class Text < Component
      # Extensions
      hstore_accessor :properties, { text: :string, font_size: :string }
      configurable font_size: { data_type: :font_size, input_type: :slider, default_value: :medium }
    end
  end
end
