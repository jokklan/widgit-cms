module Widgit
  class Column < ActiveRecord::Base
    include Positionable

    # Extensions
    positionable :block

    # Associations
    belongs_to :block, inverse_of: :columns
    belongs_to :tile, inverse_of: :columns

    # Attributes
    accepts_nested_attributes_for :tile, allow_destroy: true

    # Validations
    validates :block, :columns, presence: true

    # Callbacks
    after_destroy :destroy_block_if_empty

    def to_json
      attributes.symbolize_keys.compact.slice(:id, :columns, :position).to_json
    end

    def destroy_block_if_empty
      self.block.destroy_if_empty
    end
  end
end
