class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :assigned_task_id, null: false
      t.string :name, null: false
      t.text :description
      t.integer :work_group_id, null: false

      t.timestamps null: false
    end
  end
end
