class RenameBlocksColorToBackgroundColor < ActiveRecord::Migration
  def change
    rename_column :widgit_blocks, :color, :background_color
  end
end
