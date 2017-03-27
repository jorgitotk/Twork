class Task < ActiveRecord::Base

  validates :name, :start_time, :end_time, :work_group_id, presence: true

  has_many :assigned_tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :file_tasks, dependent: :destroy
  belongs_to :work_group

  enum status: [:future, :in_progress, :done]

end
