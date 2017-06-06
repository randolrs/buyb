class CreatePersonalSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_settings do |t|
      t.integer :user_id
      t.integer :session_id
      t.integer :preferred_category_id

      t.timestamps
    end
  end
end
