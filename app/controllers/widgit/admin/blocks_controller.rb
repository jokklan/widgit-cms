module Widgit
  module Admin
    class BlocksController < Admin::BaseController
      def new
        @block = Block.new(block_params)

        respond_to do |format|
          format.js
        end
      end

    private

      def block_params
        params.require(:block).permit(columns_layout: [])
      end
    end
  end
end
