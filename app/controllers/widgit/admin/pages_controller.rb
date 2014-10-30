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
        respond_to do |format|
          if @page.update(page_params)
            format.html { redirect_to edit_admin_page_path(@page) }
            format.json { render nothing: true }
          else
            format.json { raise @page.errors.inspect }
          end
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
        params.require(:page).permit(:title, widgets_attributes: [:id, :text])
      end
    end
  end
end
