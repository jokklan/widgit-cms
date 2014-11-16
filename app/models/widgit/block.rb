module Widgit
  class Block < ActiveRecord::Base
    include Positionable

    # Extensions
    positionable :buildable

    # Associations
    belongs_to :buildable, polymorphic: true
    has_many :columns, inverse_of: :block
    has_many :tiles, through: :columns
    has_many :components, through: :tiles

    # Attributes
    accepts_nested_attributes_for :columns
    accepts_nested_attributes_for :tiles

    # Instance Methods
    def to_json
      attributes.symbolize_keys.compact.slice(:id, :position).to_json
    end
  end
end
