class CreateWidgitWidgets < ActiveRecord::Migration
  def change
    create_table :widgit_widgets do |t|
      t.references :block, index: true
      t.string :type, null: false
      t.integer :columns, null: false
      t.integer :position, null: false
      t.hstore :properties

      t.timestamps null: false
    end
  end
end
