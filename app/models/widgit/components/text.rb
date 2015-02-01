module Widgit
  module Components
    class Text < Component
      # Extensions
      hstore_accessor :properties, { text: :string, font_size: :integer }
      configurable font_size: { data_type: :integer }
    end
  end
end
