module Widgit
  module Components
    class Icon < Component
      # Extensions
      hstore_accessor :properties, { icon: :string }
      configurable icon: { data_type: :icon, input_type: :string }
    end
  end
end
