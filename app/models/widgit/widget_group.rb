module Widgit
  class WidgetGroup < ActiveRecord::Base
    belongs_to :widgetable, polymorphic: true
    has_many :widgets
  end
end
