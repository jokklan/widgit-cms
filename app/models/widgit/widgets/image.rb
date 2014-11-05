module Widgit
  module Widgets
    class Image < Widget
      # Extensions
      hstore_accessor :properties, { image_id: :integer }

      def image
        @image ||= Widgit::Image.find_by_id(image_id)
      end
    end
  end
end
