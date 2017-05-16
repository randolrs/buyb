class OrderOffer < ApplicationRecord
	
	belongs_to :order

	belongs_to :offer

	def subtotal

		price = self.offer.price
		quantity = self.quantity

		if price && quantity

			return price * quantity

		else

			return nil

		end

	end 

end
