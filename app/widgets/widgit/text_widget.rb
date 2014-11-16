module Widgit
  class TextWidget < Apotomo::Widget
    def display(params)
      @component = params[:component]
      render
    end
  end
end
