module Widgit
  module Components
    class Header < Component
      # Extensions
<<<<<<< HEAD
      hstore_accessor :properties, { text: :string, level: :integer, font_size: :integer }
      configurable level: { data_type: :header_level, input_type: :integer, default_value: 2 }
=======
      hstore_accessor :properties, { text: :string, level: :integer, font_size: :string }
      configurable font_size: { data_type: :string }
>>>>>>> text confi
    end
  end
end
