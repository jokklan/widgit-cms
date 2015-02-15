module Widgit
  module Components
    class Header < Component
      # Extensions
      hstore_accessor :properties, { 
                        text: :string, 
                        level: :integer,
                        text_align: :integer 
                      }

      configurable level: { 
                      data_type: :header_level, 
                      input_type: :slider, 
                      default_value: 2 
                    },
                    text_align: { 
                      data_type: :text_align, 
                      input_type: :slider, 
                      default_value: 3 
                    }                    
    end
  end
end
