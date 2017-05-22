class AddUrlSlugToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :url_slug, :string
  end
end
