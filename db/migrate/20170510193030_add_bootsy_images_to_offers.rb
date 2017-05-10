class AddBootsyImagesToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :bootsy_image_gallery_id, :integer
  end
end
