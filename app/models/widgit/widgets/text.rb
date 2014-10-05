module Widgit
  module Widgets
    class Text < Widget
      # Extensions
      hstore_accessor :properties, { text: :string }
    end
  end
end
