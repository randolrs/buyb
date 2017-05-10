class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.string :headline
      t.string :sub_headline

      t.timestamps
    end
  end
end
