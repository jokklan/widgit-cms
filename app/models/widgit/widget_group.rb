module Widgit
  class WidgetGroup < ActiveRecord::Base
    # Configuration
    default_scope { order(:position) }

    # Associations
    belongs_to :widgetable, polymorphic: true
    has_many :widgets, inverse_of: :widget_group

    # Attributes
    accepts_nested_attributes_for :widgets

    # Validations
    validates :position, presence: true

    # Callbacks
    before_validation :set_position, on: :create

    # Instance Methods
    def to_json
      attributes.symbolize_keys.compact.slice(:id, :position).to_json
    end

  private

    def set_position
      self.position ||= begin
        if widgetable && (last_widget_group = widgetable.widget_groups.last)
          last_widget_group.position.to_i + 1
        else
          0
        end
      end
    end
  end
end
