module Widgit
  class Image < ActiveRecord::Base
    # Extensions
    mount_uploader :image, Widgit::ImageUploader

    # Attributes
    delegate :url, to: :image

    # Instance Methods
    def to_json
      {
        id: id,
        url: url,
        name: image.file.filename
      }.to_json
    end
  end
end
