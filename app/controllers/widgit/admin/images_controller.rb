module Widgit
  module Admin
    class ImagesController < Admin::BaseController
      def index
        @images = Image.all

        respond_to do |format|
          format.json { render json: @images.map(&:public_attributes) }
        end
      end

      def create
        @image = Image.new(image_params)

        respond_to do |format|
          if @image.save
            format.json { render json: @image.to_json }
          else
            format.json { render nothing: true }
          end
        end
      end

    private

      def image_params
        params.require(:image).permit(:image)
      end
    end
  end
end
