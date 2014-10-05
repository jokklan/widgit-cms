module Widgit
  class Page < ActiveRecord::Base
    has_many :widget_groups, as: :widgetable
  end
end
