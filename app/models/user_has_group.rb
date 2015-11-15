class UserHasGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :work_group
  has_many :assigned_tasks

  def show_member
    self.user.name
  end

end