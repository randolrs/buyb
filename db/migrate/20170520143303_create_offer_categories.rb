class CreateOfferCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :offer_categories do |t|
      t.string :name
      t.string :url_slug

      t.timestamps
    end
  end
end
