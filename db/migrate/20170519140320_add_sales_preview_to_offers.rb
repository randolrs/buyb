class AddSalesPreviewToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :sales_preview_text, :text
  end
end
