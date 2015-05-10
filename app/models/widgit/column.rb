module Widgit
  class Column < ActiveRecord::Base
    include Positionable

    # Extensions
    positionable :block

    # Associations
    belongs_to :block, inverse_of: :columns, touch: true
    belongs_to :tile, inverse_of: :columns

    # Attributes
    accepts_nested_attributes_for :tile, allow_destroy: true

    # Validations
    validates :block, :columns, presence: true

    # Callbacks
    def to_json
      public_attributes.to_json
    end

    def public_attributes
      attributes.symbolize_keys.compact.slice(:id, :columns, :position).merge(tile_attributes: tile.try(:public_attributes))
    end
  end
end
