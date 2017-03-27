class UserHasGroup < ActiveRecord::Base

  belongs_to :user
  belongs_to :work_group
  has_many :assigned_tasks

  def self.groups user
    where user_id: user.id
  end

end
