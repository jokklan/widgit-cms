module Widgit
  module Components
    class Text < Component
      # Extensions
      hstore_accessor :properties, { text: :string }
    end
  end
end
