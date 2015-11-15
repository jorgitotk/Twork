class AddColumnsOnTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :start_time, :datetime
  	add_column :tasks, :end_time, :datetime
  	add_column :tasks, :status, :integer
  end
end
