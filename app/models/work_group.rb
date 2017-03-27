class WorkGroup < ActiveRecord::Base

  has_many :tasks
  has_many :user_has_groups, dependent: :destroy
  has_many :members, through: :user_has_groups, source: :user
  belongs_to :owner, class_name: "User"
  validates :name, presence: true

  def self.own_groups user
    self.where owner: user.id
  end

end
