class AddOwnerToGroup < ActiveRecord::Migration
  def change
    add_column :work_groups, :owner, :integer
  end
end
