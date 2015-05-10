module Widgit
  class Page < ActiveRecord::Base
    # Associatiosn
    has_many :blocks, as: :buildable, dependent: :destroy
    has_many :components, through: :blocks

    # Attributes
    accepts_nested_attributes_for :blocks, reject_if: :all_blank, allow_destroy: true

    # Validations
    validates_associated :blocks

    # Instance Methods
    def public_attributes
      attributes.symbolize_keys.compact.slice(:id).merge(blocks_attributes: blocks_attributes)
    end

  private

    def blocks_attributes
      hash = {}
      blocks.map { |block| hash[block.id] = block.public_attributes }
      return hash
    end
  end
end
