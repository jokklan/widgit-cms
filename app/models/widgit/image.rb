module Widgit
  class Image < ActiveRecord::Base
    # Extensions
    mount_uploader :image, Widgit::ImageUploader

    # Attributes
    delegate :url, to: :image
  end
end
