module Widgit
  class ColorInput < SimpleForm::Inputs::StringInput
    def input
      template.content_tag(:div, super, class: "color-editor", data: { editor: 'color' }) 
    end

    def input_type
      :string
    end
  end
end
