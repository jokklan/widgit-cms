module Widgit
  class Block < ActiveRecord::Base
    # Configuration
    default_scope { order(:position) }

    # Associations
    belongs_to :componentable, polymorphic: true
    has_many :components, inverse_of: :block

    # Attributes
    accepts_nested_attributes_for :components

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
        if componentable && (last_block = componentable.blocks.last)
          last_block.position.to_i + 1
        else
          0
        end
      end
    end
  end
end