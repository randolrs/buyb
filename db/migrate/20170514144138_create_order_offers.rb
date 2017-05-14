class CreateOrderOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :order_offers do |t|
      t.integer :order_id
      t.integer :offer_id

      t.timestamps
    end
  end
end
