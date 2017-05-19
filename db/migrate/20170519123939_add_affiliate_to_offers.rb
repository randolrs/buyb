class AddAffiliateToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :affiliate, :boolean
    add_column :offers, :affiliate_link, :string
  end
end
