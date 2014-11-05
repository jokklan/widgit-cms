module Widgit
  module HasWidgets
    extend ActiveSupport::Concern

    included do
      has_widgets do |root|
        Widgit::Widget.types.each do |type|
          root << widget("widgit/#{type}", page: @page)
        end
      end
    end
  end
end