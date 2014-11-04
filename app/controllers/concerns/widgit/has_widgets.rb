module Widgit
  module HasWidgets
    extend ActiveSupport::Concern

    included do
      has_widgets do |root|
        root << widget('widgit/text', page: @page)
        root << widget('widgit/header', page: @page)
      end
    end
  end
end
