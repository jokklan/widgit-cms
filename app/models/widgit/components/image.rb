module Widgit
  module Components
    class Image < Component
      # Extensions
      hstore_accessor :properties, { image_id: :integer }
      configurable image_id: { data_type: :image, input_type: :integer }

      def image
        @image ||= Widgit::Image.find_by_id(image_id) || Widgit::Image.new
      end
    end
  end
end
