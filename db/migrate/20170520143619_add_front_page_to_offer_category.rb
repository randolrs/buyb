class AddFrontPageToOfferCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :offer_categories, :front_page, :boolean
  end
end
