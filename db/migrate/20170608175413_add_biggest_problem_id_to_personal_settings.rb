class AddBiggestProblemIdToPersonalSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :personal_settings, :biggest_problem_id, :integer
  end
end
