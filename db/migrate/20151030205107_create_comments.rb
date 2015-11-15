class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :assigned_task_id, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
