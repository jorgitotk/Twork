class RemoveColumnsOnAssignedTask < ActiveRecord::Migration
  def change
  	remove_column :assigned_tasks, :start_datetime
  	remove_column :assigned_tasks, :end_datetime
  	remove_column :assigned_tasks, :state
  end
end
