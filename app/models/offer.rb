class Offer < ApplicationRecord
	include Bootsy::Container

	has_many :order_offers

	belongs_to :creator

	has_many :offer_category_tags


	has_attached_file :image, 
		:styles => { :medium => "600x400", :small => "70x70#"},
		:default_url => 'missing_item_photo.png',
		:s3_protocol => :https

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def has_category_tag(category_id)

		count = OfferCategoryTag.where(:offer_id => self.id, :offer_category_id => category_id, :is_active => true).count

		if count > 0

			return true
		else

			return false
		end

	end


	def set_url_slug


		original_slug = self.name.downcase.gsub(' ', '-')

		slug = original_slug

		c=0
		i=1

		until c==1 do

			unless Offer.where(:name_url_slug => slug).exists?

			  self.update(:name_url_slug => slug)

			  return
			  
			  c=1

			else

			  i = i + 1

			  slug = original_slug + "-" + i.to_s

			end

		end


	end



end
