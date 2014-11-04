module Widgit
  module Admin
    class WidgetGroupsController < Admin::BaseController
      include Widgit::HasWidgets

      def new
        @widget_group = WidgetGroup.new(widget_group_params)

        respond_to do |format|
          format.js
        end
      end

    private

      def widget_group_params
        params.require(:widget_group).permit(widgets_attributes: [:type, :text, :position, :columns])
      end
    end
  end
end
