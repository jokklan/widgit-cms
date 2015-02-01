module Widgit
  class ImageInput < SimpleForm::Inputs::StringInput
    def input
      template.content_tag :div, super, data: { editor: 'image' }
    end

    def input_type
      :string
    end
  end
end
