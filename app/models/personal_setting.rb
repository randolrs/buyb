class PersonalSetting < ApplicationRecord

	def preferred_category_object

		category = OfferCategory.find(self.preferred_category_id)

		if category

			return category

		else

			return nil

		end

	end
	
end
