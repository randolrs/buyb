class AddActiveToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :active, :boolean
  end
end
