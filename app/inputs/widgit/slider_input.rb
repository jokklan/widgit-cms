module Widgit
  class SliderInput < SimpleForm::Inputs::StringInput
    def input
      template.content_tag :div, data: { input: 'slider' } do
        template.content_tag(:div, super, class: "XXXhidden") + 
          template.content_tag(:div, "", data:{ slider: "target"} )          
      end

    end

    def input_type
      :string
    end
  end
end
