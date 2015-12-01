class CreateFileTasks < ActiveRecord::Migration
  def change
    create_table :file_tasks do |t|
      t.references :task, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.attachment :image
      t.string :title

      t.timestamps null: false
    end
  end
end
