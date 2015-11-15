class OwnerNullFalseInGroups < ActiveRecord::Migration
  def change
    change_column :work_groups, :owner, :integer, null: false
  end
end
