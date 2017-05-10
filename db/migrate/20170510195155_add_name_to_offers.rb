class AddNameToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :name, :string
    add_column :offers, :name_url_slug, :string
  end
end
