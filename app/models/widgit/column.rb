module Widgit
  class Column < ActiveRecord::Base
    include Positionable

    # Extensions
    positionable :block

    # Associations
    belongs_to :block, inverse_of: :columns
    belongs_to :tile, inverse_of: :columns

    # Attributes
    accepts_nested_attributes_for :tile

    # Validations
    validates :block, :columns, presence: true

    def to_json
      attributes.symbolize_keys.compact.slice(:id, :columns, :position).to_json
    end
  end
end
