class AddMainCategoryToOfferCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :offer_categories, :main_category, :boolean
  end
end
