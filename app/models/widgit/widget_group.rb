module Widgit
  class WidgetGroup < ActiveRecord::Base
    # Configuration
    default_scope { order(:position) }

    # Associations
    belongs_to :widgetable, polymorphic: true
    has_many :widgets
  end
end
