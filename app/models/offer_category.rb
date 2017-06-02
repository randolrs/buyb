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

	def top_offers

		return self.offers.where(:active => true)

	end


	def new_offers

		return self.offers.where(:active => true)

	end

	def child_categories

		return OfferCategory.where(:parent_category_id => self.id)
	end


	def parent_category

		return OfferCategory.where(:id => self.parent_category_id).last
	end


end
