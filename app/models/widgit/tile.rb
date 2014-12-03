module Widgit
  class Tile < ActiveRecord::Base
    include Parentable

    # Extensions
    parentable :components

    # Associations
    has_many :columns, inverse_of: :tile, dependent: :destroy
    has_many :blocks, through: :columns
    has_many :components, inverse_of: :tile, dependent: :destroy

    # Attributes
    accepts_nested_attributes_for :components, allow_destroy: true

    # Validations
    validates_associated :components

    # Scopes
    scope :saved, -> { where(saved: true) }

    # Instance Methods
    def components_attributes=(attributes_collections)
      component_ids = attributes_collections.values.map { |attributes| attributes[:id] }.map(&:to_i)
      self.components << Component.find(component_ids)
      super(attributes_collections)
    end
  end
end