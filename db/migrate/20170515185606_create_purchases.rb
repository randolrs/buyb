class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.string :email
      t.string :stripe_card_id
      t.decimal :amount
      t.string :description
      t.string :currency
      t.string :stripe_customer_id
      t.integer :order_id
      t.string :ip_address

      t.timestamps
    end
  end
end
