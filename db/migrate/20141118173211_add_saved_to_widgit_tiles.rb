class AddSavedToWidgitTiles < ActiveRecord::Migration
  def change
    add_column :widgit_tiles, :saved, :boolean, null: false, default: false
  end
end
