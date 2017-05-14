class AddQuantityToOrderOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :order_offers, :quantity, :integer
  end
end
