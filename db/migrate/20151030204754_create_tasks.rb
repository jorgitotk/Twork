class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :work_group_id, null: false
      t.string :name, null: false
      t.text :description
      t.integer :status, null: false, default: 0
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps null: false
    end
  end
end
