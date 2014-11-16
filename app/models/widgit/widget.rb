module Widgit
  class Widget < ActiveRecord::Base
    # Configuration
    default_scope { order(:position) }

    # Association
    belongs_to :block, inverse_of: :widgets
    has_one :page, through: :block

    # Validations
    validates :block, :type, :columns, :position, presence: true

    # Callbacks
    before_validation :set_position, on: :create

    # Instance Methods
    def to_json
      attributes.symbolize_keys.compact.slice(:id, :type, :text, :position, :columns).to_json
    end

    def widget_type
      type.demodulize.downcase
    end

    # Class Methods
    def self.types
      %w(header text image)
    end

  private

    # Private Instance Methods
    def set_position
      self.position ||= begin
        if block && (last_widget = block.widgets.last)
          last_widget.position.to_i + 1
        else
          0
        end
      end
    end
  end
end
