module Widgit
  class Block < ActiveRecord::Base
    # Configuration
    default_scope { order(:position) }

    # Associations
    belongs_to :buildable, polymorphic: true
    has_many :columns, inverse_of: :block
    has_many :tiles, through: :columns
    has_many :components, through: :tiles

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
        if buildable && (last_block = buildable.blocks.last)
          last_block.position.to_i + 1
        else
          0
        end
      end
    end
  end
end
