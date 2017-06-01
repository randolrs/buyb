class AddHomePageToOfferCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :offer_categories, :home_page, :boolean
  end
end
