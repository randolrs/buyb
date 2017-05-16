class Order < ApplicationRecord
	
	has_many :order_offers

	def order_total

		total = 0

		self.order_offers.each do |order_offer|

			if order_offer.subtotal
				total = total + order_offer.subtotal
			end
		end

		return total


	end
	
end
