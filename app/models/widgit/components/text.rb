module Widgit
  module Components
    class Text < Component
      # Extensions
      hstore_accessor :properties, { text: :string, font_size: :integer }
      configurable font_size: :integer
    end
  end
end
