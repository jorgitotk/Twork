class AssignedTask < ActiveRecord::Base
  belongs_to :user_has_group
  belongs_to :task
  has_many :comments
  validates :task_id, presence: true
end
