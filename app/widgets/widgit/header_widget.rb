module Widgit
  class HeaderComponent < Apotomo::Widget
    def display(params)
      @component = params[:component]
      render
    end
  end
end
