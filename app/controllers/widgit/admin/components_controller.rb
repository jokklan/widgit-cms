module Widgit
  module Admin
    class ComponentsController < Admin::BaseController
      def new
        @component = Component.new(component_params)

        respond_to do |format|
          format.js
        end
      end

    private

      def component_params
        params.require(:component).permit(:type)
      end
    end
  end
end
