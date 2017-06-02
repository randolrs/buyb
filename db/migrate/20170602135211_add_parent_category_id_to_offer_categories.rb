class AddParentCategoryIdToOfferCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :offer_categories, :parent_category_id, :integer
  end
end
