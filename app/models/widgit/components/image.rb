module Widgit
  module Components
    class Image < Component
      # Extensions
      hstore_accessor :properties, { image_id: :integer }

      def image
        @image ||= Widgit::Image.find_by_id(image_id)
      end
    end
  end
end
