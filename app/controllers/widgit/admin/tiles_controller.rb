module Widgit
  module Admin
    class TilesController < Admin::BaseController
      before_action :find_tile, only: [:show, :update]

      def show
        render layout: false
      end

      def update
        respond_to do |format|
          if @tile.update(tile_params)
            format.json { render nothing: true }
          else
            format.json
          end
        end
      end

    private

      def find_tile
        @tile = Tile.find(params[:id])
      end

      def tile_params
        params.require(:tile).permit(:saved)
      end
    end
  end
end
