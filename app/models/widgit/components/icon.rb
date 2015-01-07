module Widgit
  module Components
    class Icon < Component
      # Extensions      
      hstore_accessor :properties, { icon: :string }
    end
  end
end
