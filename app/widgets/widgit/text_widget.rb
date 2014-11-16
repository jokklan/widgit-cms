module Widgit
  class TextComponent < Apotomo::Widget
    def display(params)
      @component = params[:component]
      render
    end
  end
end
