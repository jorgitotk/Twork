class CreateUserHasGroups < ActiveRecord::Migration
  def change
    create_table :user_has_groups do |t|
      t.integer :work_group_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
