class AddPositionToWidgitWidgetGroups < ActiveRecord::Migration
  def change
    add_column :widgit_widget_groups, :position, :integer
  end
end
