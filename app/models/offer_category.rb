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

	def top_offers_for_user(user_id)

		offers_sorted_by_weight = Array.new

		offers_only_matrix = Array.new

		self.offers.where(:active => true).each do |offer|

			if offer.chapter_to_read != "" && offer.weight_for_user(user_id) > 0

				offers_sorted_by_weight << [offer,offer.weight_for_user(user_id)]

			end
		end

		offers_sorted_by_weight.sort_by(&:last).reverse.each do |item|

			offers_only_matrix << item[0]

		end

		return offers_only_matrix

	end


	def new_offers

		return self.offers.where(:active => true).order(created_at: :desc)

	end

	def child_categories

		return OfferCategory.where(:parent_category_id => self.id)
	end


	def parent_category

		return OfferCategory.where(:id => self.parent_category_id).last
	end

	def self.main_category

		main_category = OfferCategory.where(:main_category => true).last

		if main_category

			return main_category

		else

			return OfferCategory.first

		end

	end


end
