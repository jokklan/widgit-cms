module Widgit
  class Page < ActiveRecord::Base
    # Associatiosn
    has_many :widget_groups, as: :widgetable
    has_many :widgets, through: :widget_groups

    # Attributes
    accepts_nested_attributes_for :widget_groups
    accepts_nested_attributes_for :widgets
  end
end
