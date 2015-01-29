module Widgit
  class FormBuilder < SimpleForm::FormBuilder
    map_type :icon, to: Widgit::IconInput
    map_type :color, to: Widgit::ColorInput
    map_type :image, to: Widgit::ImageInput
  end
end
