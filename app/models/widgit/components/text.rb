module Widgit
  module Components
    class Text < Component
      # Extensions
      hstore_accessor :properties, { 
                        text: :string, 
                        font_size: :integer, 
                        text_align: :integer 
                      }               
                            
      configurable font_size: { 
                      data_type: :font_size, 
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
