module Widgit
  module Components
    class Text < Component
      # Extensions
      hstore_accessor :properties, { text: :string, font_size: :string }
      configurable font_size: { data_type: :string }
    end
  end
end
