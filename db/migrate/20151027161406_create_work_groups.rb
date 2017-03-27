class CreateWorkGroups < ActiveRecord::Migration
  def change
    create_table :work_groups do |t|
      t.string :name, null: false
      t.integer :owner_id, foreign_key: false, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
