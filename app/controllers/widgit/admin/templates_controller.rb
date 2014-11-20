module Widgit
  module Admin
    class TemplatesController < Admin::BaseController
      def create
        @template = Template.new(template_params)

        respond_to do |format|
          if @template.save
            format.json { render json: @template.to_json }
          else
            format.json { render nothing: true }
          end
        end
      end

    private

      def template_params
        params.require(:template).permit(stored_attributes: [:id, components_attributes: [:id, :type, :text, :image_id, :position]])
      end
    end
  end
end
