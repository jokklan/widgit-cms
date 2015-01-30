module Widgit
  class ImageInput < SimpleForm::Inputs::FileInput
    def input
      template.content_tag :div, super, data: { editor: 'image' }
    end
  end
end
