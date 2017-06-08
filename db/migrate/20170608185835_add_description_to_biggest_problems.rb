class AddDescriptionToBiggestProblems < ActiveRecord::Migration[5.0]
  def change
    add_column :biggest_problems, :description, :text
  end
end
