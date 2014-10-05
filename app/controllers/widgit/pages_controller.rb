module Widgit
  class PagesController < BaseController
    has_widgets do |root|
      root << widget('widgit/text', page: @page)
    end

    def show
      @page = Page.find(params[:id])
    end
  end
end
