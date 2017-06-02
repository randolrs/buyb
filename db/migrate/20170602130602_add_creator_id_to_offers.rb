class AddCreatorIdToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :creator_id, :integer
  end
end
