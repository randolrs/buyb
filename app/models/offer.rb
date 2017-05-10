class Offer < ApplicationRecord
	include Bootsy::Container


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
