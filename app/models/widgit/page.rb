module Widgit
  class Page < ActiveRecord::Base
    # Associatiosn
    has_many :blocks, as: :buildable
    has_many :components, through: :blocks

    # Attributes
    accepts_nested_attributes_for :blocks
  end
end
