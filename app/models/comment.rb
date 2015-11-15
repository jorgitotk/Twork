class Comment < ActiveRecord::Base
	belongs_to :assigned_task
end
