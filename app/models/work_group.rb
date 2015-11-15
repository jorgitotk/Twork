class WorkGroup < ActiveRecord::Base
  has_many :user_has_groups, dependent: :destroy
  has_many :tasks

  validates :name, presence: true

  def self.own_groups(user)
    self.where(owner: user.id)
  end

end
