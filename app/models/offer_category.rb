class OfferCategory < ApplicationRecord

	has_many :offer_category_tags

	has_many :offers, :through => :offer_category_tags

	def self.sidebar_categories(current_category)

		if current_category

			categories = OfferCategory.where(:front_page => true).where.not(:id => current_category.id)

			return categories

		else

			categories = OfferCategory.where(:front_page => true)

			return categories


		end


	end


end
