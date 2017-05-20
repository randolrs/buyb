class AddIsActiveToOfferCategoryTags < ActiveRecord::Migration[5.0]
  def change
    add_column :offer_category_tags, :is_active, :boolean
  end
end
