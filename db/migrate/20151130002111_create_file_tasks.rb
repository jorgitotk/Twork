class CreateFileTasks < ActiveRecord::Migration
  def change
    create_table :file_tasks do |t|
      t.integer :task_id
      t.integer :user_id
      t.attachment :image
      t.string :title

      t.timestamps null: false
    end
  end
end
