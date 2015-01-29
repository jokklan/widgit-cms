module Widgit
  module Components
    class Header < Component
      # Extensions
      hstore_accessor :properties, { text: :string, level: :integer, font_size: :integer }
      configurable font_size: :integer
    end
  end
end
