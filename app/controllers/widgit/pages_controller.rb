module Widgit
  class PagesController < BaseController
    include Widgit::HasComponents

    def show
      @page = Page.find(params[:id])
    end
  end
end
