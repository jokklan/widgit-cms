class CreateWidgitBlocks < ActiveRecord::Migration
  def change
    create_table :widgit_blocks do |t|
      t.references :buildable, polymorphic: true, index: true
      t.integer :position, null: false

      t.timestamps null: false
    end
  end
end
