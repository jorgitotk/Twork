class DeleteOwnerFromUserHasGroup < ActiveRecord::Migration
  def change
    remove_column :user_has_groups, :owner_group
  end
end
