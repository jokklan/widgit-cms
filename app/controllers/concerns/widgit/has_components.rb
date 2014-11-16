module Widgit
  module HasComponents
    extend ActiveSupport::Concern

    included do
      has_widgets do |root|
        Widgit::Component.types.each do |type|
          root << widget("widgit/#{type}", page: @page)
        end
      end
    end
  end
end
