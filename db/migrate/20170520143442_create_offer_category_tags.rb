class CreateOfferCategoryTags < ActiveRecord::Migration[5.0]
  def change
    create_table :offer_category_tags do |t|
      t.integer :offer_category_id
      t.integer :offer_id

      t.timestamps
    end
  end
end
