class FileTask < ActiveRecord::Base
	belongs_to :task
	has_attached_file :image, styles: { medium: "800x600", square1: "100x100", square2: "200x200", modal: "600x400" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
