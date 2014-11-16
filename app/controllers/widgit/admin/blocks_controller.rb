module Widgit
  module Admin
    class BlocksController < Admin::BaseController
      include Widgit::HasComponents

      def new
        @block = Block.new(block_params)

        respond_to do |format|
          format.js
        end
      end

    private

      def block_params
        params.require(:block).permit(columns_attributes: [:columns])
      end
    end
  end
end
