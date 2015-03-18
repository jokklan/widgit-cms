module Widgit
  class Block < ActiveRecord::Base
    include Positionable
    include Parentable
    include Configurable

    # Extensions
    configurable background_color: { data_type: :background_color, input_type: :color }, background_image_id: { data_type: :image, input_type: :image }
    positionable :buildable
    parentable :columns

    # Associations
    belongs_to :buildable, polymorphic: true
    has_many :columns, inverse_of: :block, dependent: :destroy
    has_many :tiles, through: :columns
    has_many :components, through: :tiles
    belongs_to :background_image, class_name: 'Widgit::Image'

    # Attributes
    accepts_nested_attributes_for :columns, allow_destroy: true

    # Validations
    validates_associated :columns
    validates_associated :tiles

    # Instance Methods
    def to_json
      public_attributes.to_json
    end

    def columns_layout=(value)
      self.columns_attributes = value.map { |columns| { columns: columns } }
    end

    def attribute_types
      {

      }
    end

    def public_attributes
      attributes.symbolize_keys.compact.slice(:id, :position, :background_color, :background_image_id).merge(background_image_url: background_image.try(:url), columns: columns.map(&:public_attributes))
    end
  end
end
