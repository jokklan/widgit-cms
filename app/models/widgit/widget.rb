module Widgit
  class Widget < ActiveRecord::Base
    # Configuration
    default_scope { order(:position) }

    # Association
    belongs_to :widget_group, inverse_of: :widgets
    has_one :page, through: :widget_group

    # Validations
    validates :widget_group, :type, :columns, :position, presence: true

    # Callbacks
    before_validation :set_position, on: :create

    # Class Methods
    def to_json
      attributes.symbolize_keys.compact.slice(:id, :type, :text, :position, :columns).to_json
    end

  private

    # Private Instance Methods
    def set_position
      self.position ||= begin
        if widget_group && (last_widget = widget_group.widgets.last)
          last_widget.position.to_i + 1
        else
          0
        end
      end
    end
  end
end
