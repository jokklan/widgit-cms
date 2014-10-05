module Widgit
  class TextWidget < Apotomo::Widget
    def display(params)
      @widget = params[:widget]
      render
    end
  end
end
