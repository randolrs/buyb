class AddHowMuchToPersonalSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :personal_settings, :made_money, :boolean
  end
end
