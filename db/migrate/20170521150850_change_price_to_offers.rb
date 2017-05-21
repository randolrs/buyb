class ChangePriceToOffers < ActiveRecord::Migration[5.0]
  def change
  	change_column :offers, :price, :decimal
  end
end
