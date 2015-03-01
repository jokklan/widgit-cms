module Widgit
  class Image < ActiveRecord::Base
    # Extensions
    mount_uploader :image, Widgit::ImageUploader

    # Attributes
    delegate :url, to: :image

    # Instance Methods
    def to_json
      public_attributes.to_json
    end

    def public_attributes
      {
        id: id,
        url: url,
        name: image.file.filename
      }
    end
  end
end
