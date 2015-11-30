class Task < ActiveRecord::Base
  has_many :assigned_tasks
  validates :name, :start_time, :end_time, :work_group_id, presence: true
  belongs_to :work_group
  has_many :comments
  has_many :file_tasks

  enum status: { future: 1, in_progress: 2, done: 3 }

  before_create :set_default_status

  def set_default_status
  	self.status = 1
  end
end
