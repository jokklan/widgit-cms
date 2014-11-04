class CreateWidgitWidgetGroups < ActiveRecord::Migration
  def change
    create_table :widgit_widget_groups do |t|
      t.references :widgetable, polymorphic: true, index: { name: 'index_widgit_widget_groups_on_widgetable' }
      t.integer :position, null: false

      t.timestamps null: false
    end
  end
end
