class Post < ApplicationRecord
	include Bootsy::Container

	has_attached_file :image, 
		:styles => { :medium => "600x", :small => "70x70#"},
		:default_url => 'missing_item_photo.png',
		:s3_protocol => :https

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


	
end
