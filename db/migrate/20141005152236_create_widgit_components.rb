class CreateWidgitComponents < ActiveRecord::Migration
  def change
    create_table :widgit_components do |t|
      t.references :tile, index: true
      t.string :type, null: false
      t.integer :position, null: false
      t.hstore :properties

      t.timestamps null: false
    end
  end
end
