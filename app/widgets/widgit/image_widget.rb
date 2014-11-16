module Widgit
  class ImageComponent < Apotomo::Widget
    def display(params)
      @component = params[:component]
      render
    end
  end
end
