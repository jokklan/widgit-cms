class CreateWidgitTemplates < ActiveRecord::Migration
  def change
    create_table :widgit_templates do |t|
      t.json :stored_attributes

      t.timestamps
    end
  end
end
