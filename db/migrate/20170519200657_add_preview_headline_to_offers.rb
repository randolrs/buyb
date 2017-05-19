class AddPreviewHeadlineToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :preview_headline, :string
  end
end
