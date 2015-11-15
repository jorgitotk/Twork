class CreateWorkGroups < ActiveRecord::Migration
  def change
    create_table :work_groups do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
