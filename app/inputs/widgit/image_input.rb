module Widgit
  class ImageInput < SimpleForm::Inputs::StringInput
    def input
      super + template.image_tag(nil, class: 'img-responsive gt-bottom')
    end

    def input_type
      :string
    end
  end
end
