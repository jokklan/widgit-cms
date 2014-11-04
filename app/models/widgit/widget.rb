module Widgit
  class Widget < ActiveRecord::Base
    # Configuration
    default_scope { order(:position) }

    # Association
    belongs_to :widget_group, inverse_of: :widgets

    # Validations
    validates :widget_group, :type, :columns, :position, presence: true

    # Callbacks
    before_validation :set_position, on: :create

  private

    def set_position
      self.position ||= begin
        if widget_group && (last_widget = widget_group.widgets.last)
          last_widget.position + 1
        else
          0
        end
      end
    end
  end
end
