class WorkGroup < ActiveRecord::Base
  has_many :user_has_groups, dependent: :destroy
  has_many :tasks

  validates :name, presence: true

  def nameowner
  		User.find(self.owner)	
  end

  def self.own_groups(user)
    self.where(owner: user.id)
  end

  def self.groups(user)
    self.where.not(owner: user.id)
  end



end
