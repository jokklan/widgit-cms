module Widgit
  module Admin
    class BlocksController < Admin::BaseController
      def new
        @block = Block.new(block_params)

        respond_to do |format|
          format.js
        end
      end

      def show
        @block = Block.find(params[:id])

        @block.assign_attributes params.require(:block).permit!
      end

    private

      def block_params
        params.require(:block).permit(columns_layout: [])
      end
    end
  end
end
