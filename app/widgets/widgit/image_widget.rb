module Widgit
  class ImageWidget < Apotomo::Widget
    def display(params)
      @widget = params[:widget]
      render
    end
  end
end