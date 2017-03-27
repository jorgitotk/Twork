class CreateAssignedTasks < ActiveRecord::Migration
  def change
    create_table :assigned_tasks do |t|
      t.integer :user_has_group_id, null: false
      t.datetime :start_time
      t.datetime :end_time
      t.integer :task_id
      t.timestamps null: false
    end
  end
end
