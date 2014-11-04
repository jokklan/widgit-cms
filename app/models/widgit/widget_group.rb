module Widgit
  class WidgetGroup < ActiveRecord::Base
    # Configuration
    default_scope { order(:position) }

    # Associations
    belongs_to :widgetable, polymorphic: true
    has_many :widgets

    # Validations
    validates :position, presence: true

    # Callbacks
    before_validation :set_position, on: :create

  private

    def set_position
      self.position ||= begin
        if widgetable && (last_widget_group = widgetable.widget_groups.last)
          last_widget_group.position + 1
        else
          0
        end
      end
    end
  end
end
