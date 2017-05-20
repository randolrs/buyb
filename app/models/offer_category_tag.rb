class OfferCategoryTag < ApplicationRecord
	
	belongs_to :offer_category
	belongs_to :offer

end
