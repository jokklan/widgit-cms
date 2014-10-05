class CreateWidgitPages < ActiveRecord::Migration
  def change
    create_table :widgit_pages do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
