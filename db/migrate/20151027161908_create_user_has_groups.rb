class CreateUserHasGroups < ActiveRecord::Migration
  def change
    create_table :user_has_groups do |t|
      t.integer :work_group_id, null: false
      t.integer :user_id, null: false
      t.boolean :owner_group

      t.timestamps null: false
    end
  end
end
