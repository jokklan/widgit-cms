module Widgit
  class Page < ActiveRecord::Base
    # Associatiosn
    has_many :blocks, as: :widgetable
    has_many :widgets, through: :blocks

    # Attributes
    accepts_nested_attributes_for :blocks
  end
end
