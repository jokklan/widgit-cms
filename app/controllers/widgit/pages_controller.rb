module Widgit
  class PagesController < BaseController
    include Widgit::HasWidgets

    def show
      @page = Page.find(params[:id])
    end
  end
end
