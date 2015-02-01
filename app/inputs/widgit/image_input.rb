module Widgit
  class ImageInput < SimpleForm::Inputs::StringInput
    ## Because image tage doesnot work if not included the below
     include ActionView::Helpers::AssetTagHelper
     def input
      ("#{super}" + "#{image_tag(nil)}").html_safe
     end

    def input_type
      :string
    end
  end
end
