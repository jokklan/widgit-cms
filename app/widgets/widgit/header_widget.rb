module Widgit
  class HeaderWidget < Apotomo::Widget
    def display(params)
      @component = params[:component]
      render
    end
  end
end
