class CreateWidgitBlocks < ActiveRecord::Migration
  def change
    create_table :widgit_blocks do |t|
      t.references :widgetable, polymorphic: true, index: { name: 'index_widgit_blocks_on_widgetable' }
      t.integer :position, null: false

      t.timestamps null: false
    end
  end
end
