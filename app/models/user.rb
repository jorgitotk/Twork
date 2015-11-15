class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_has_groups

  def name
  	"#{first_name} #{last_name}"
  end

  def self.search_name(query)
    if query
      where('first_name || last_name LIKE ?', "%#{query}%")
    else
      all
    end
  end

end
