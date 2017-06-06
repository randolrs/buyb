class ChangeSessionIdToPersonalSettings < ActiveRecord::Migration[5.0]
  def change

  	change_column :personal_settings, :session_id, :string
  	
  end
end
