module Widgit
  module Components
    class Image < Component
      # Extensions
      hstore_accessor :properties, { image_id: :integer }
      configurable image_id: :image

      def image
        @image ||= Widgit::Image.find_by_id(image_id) || Widgit::Image.new
      end
    end
  end
end
