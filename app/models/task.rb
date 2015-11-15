class Task < ActiveRecord::Base
  has_many :assigned_tasks
  validates :name, :start_time, :end_time, :work_group_id, presence: true
  belongs_to :work_group
end
