module Widgit
  class Tile < ActiveRecord::Base
    # Associations
    has_many :columns, inverse_of: :block
    has_many :blocks, through: :columns
    has_many :components, inverse_of: :tile

    # Attributes
    accepts_nested_attributes_for :components
  end
end
