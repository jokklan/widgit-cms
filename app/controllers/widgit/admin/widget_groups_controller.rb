module Widgit
  module Admin
    class BlocksController < Admin::BaseController
      include Widgit::HasWidgets

      def new
        @block = Block.new(block_params)

        respond_to do |format|
          format.js
        end
      end

    private

      def block_params
        params.require(:block).permit(widgets_attributes: [:type, :text, :position, :columns])
      end
    end
  end
end
