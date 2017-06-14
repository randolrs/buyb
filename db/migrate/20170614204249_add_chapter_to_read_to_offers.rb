class AddChapterToReadToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :chapter_to_read, :text
  end
end
