class AddReasonsToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :reason_we_recommend, :text
    add_column :offers, :who_this_is_good_for, :text
  end
end
