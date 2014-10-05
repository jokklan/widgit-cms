module Widgit
  module Admin
    class PagesController < BaseController
      before_action :find_page, only: [:edit, :update, :destroy]

      def index
        @pages = Page.all
      end

      def new
        @page = Page.new
      end

      def edit
      end

      def create
        @page = Page.new(page_params)

        if @page.save
          redirect_to admin_pages_path
        else
          render 'new'
        end
      end

      def update
        if @page.update(page_params)
          redirect_to edit_admin_page_path(@page)
        else
          render 'edit'
        end
      end

      def destroy
        @page.destroy
        redirect_to admin_pages_path
      end

    private

      def find_page
        @page = Page.find(params[:id])
      end

      def page_params
        params.require(:page).permit(:title)
      end
    end
  end
end
