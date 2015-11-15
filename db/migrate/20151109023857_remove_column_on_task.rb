class RemoveColumnOnTask < ActiveRecord::Migration
  def change
  	remove_column :tasks, :assigned_task_id
  end
end
