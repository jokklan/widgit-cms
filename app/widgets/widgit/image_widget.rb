module Widgit
  class ImageWidget < Apotomo::Widget
    def display(params)
      @component = params[:component]
      render
    end
  end
end
