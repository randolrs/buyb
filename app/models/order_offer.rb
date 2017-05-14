class OrderOffer < ApplicationRecord
	
	belongs_to :order

	belongs_to :offer

end
