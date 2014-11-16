module Widgit
  class Block < ActiveRecord::Base
    include Positionable

    # Extensions
    positionable :buildable

    # Associations
    belongs_to :buildable, polymorphic: true
    has_many :columns, inverse_of: :block, dependent: :destroy
    has_many :tiles, through: :columns
    has_many :components, through: :tiles

    # Attributes
    accepts_nested_attributes_for :columns, allow_destroy: true

    # Validations
    validates_associated :columns
    validates_associated :tiles

    # Callbacks
    before_validation :destroy_if_empty

    # Instance Methods
    def to_json
      attributes.symbolize_keys.compact.slice(:id, :position).to_json
    end

    def destroy_if_empty
      self.destroy if columns.size.zero?
    end
  end
end
