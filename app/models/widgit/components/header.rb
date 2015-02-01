module Widgit
  module Components
    class Header < Component
      # Extensions
      hstore_accessor :properties, { text: :string, level: :integer, font_size: :integer }
      configurable level: { data_type: :header_level, input_type: :integer, default_value: 2 }
    end
  end
end
