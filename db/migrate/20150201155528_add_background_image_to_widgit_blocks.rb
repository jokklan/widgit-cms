class AddBackgroundImageToWidgitBlocks < ActiveRecord::Migration
  def change
    add_reference :widgit_blocks, :background_image, index: true
  end
end
