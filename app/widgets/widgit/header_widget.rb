module Widgit
  class HeaderWidget < Apotomo::Widget
    def display(params)
      @widget = params[:widget]
      render
    end
  end
end
