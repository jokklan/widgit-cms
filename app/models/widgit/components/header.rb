module Widgit
  module Components
    class Header < Component
      # Extensions
      hstore_accessor :properties, { text: :string, level: :integer, font_size: :integer }
      configurable font_size: { data_type: :integer }
    end
  end
end
