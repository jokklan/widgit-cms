module Widgit
  class Widget < ActiveRecord::Base
    # Association
    belongs_to :widget_group, inverse_of: :widgets

    # Validations
    validates :widget_group, :type, presence: true
  end
end
