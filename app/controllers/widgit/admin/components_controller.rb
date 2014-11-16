module Widgit
  module Admin
    class ComponentsController < Admin::BaseController
      before_action :set_tile

      def new
        @component = Component.new(component_params)

        respond_to do |format|
          format.js
        end
      end

    private

      def set_tile
        @tile = Tile.find(params[:tile_id])
      end

      def component_params
        params.require(:component).permit(:type).tap do |whitelist|
          whitelist[:tile_id] = params[:tile_id]
        end
      end
    end
  end
end
