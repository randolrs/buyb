class AddContentToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :content, :text
  end
end
