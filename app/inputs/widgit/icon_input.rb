module Widgit
  class IconInput < SimpleForm::Inputs::StringInput
    def input
      template.content_tag :div, super, data: { editor: 'icon' }
    end

    def input_type
      :string
    end
  end
end
