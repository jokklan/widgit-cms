module Widgit
  module Components
    class Image < Component
      # Extensions
      hstore_accessor :properties, { image_id: :integer, link_url: :string }
      configurable image_id: { data_type: :image, input_type: :image }, link_url: { data_type: :string }

      def image
        @image ||= Widgit::Image.find_by_id(image_id) || Widgit::Image.new
      end

      def public_attributes
        properties.symbolize_keys.slice(:image_id, :link_url).merge(image: image.public_attributes).merge(type: component_type).compact
         # name: image_alt(image.image.url), path: image.image.url, link_url: image.link_url }
      end

      def component_type
        type.split('::').last
      end
    end
  end
end
