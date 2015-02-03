module Widgit
  class SliderInput < SimpleForm::Inputs::StringInput
    def input
      template.content_tag :div, data: { input: 'slider' } do
        template.content_tag(:div, super, class: "hidden") + 
        template.content_tag(:div, "", data:{ slider: "target"} ) + 
        template.content_tag(:ul, class: "slider-labels") do
          template.content_tag(:li, "Small") +
          template.content_tag(:li, "Medium") +
          template.content_tag(:li, "Large")
        end
      end

    end

    def input_type
      :string
    end
  end
end
