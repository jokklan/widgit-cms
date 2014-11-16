class CreateWidgitBlocks < ActiveRecord::Migration
  def change
    create_table :widgit_blocks do |t|
      t.references :componentable, polymorphic: true, index: { name: 'index_widgit_blocks_on_componentable' }
      t.integer :position, null: false

      t.timestamps null: false
    end
  end
end
