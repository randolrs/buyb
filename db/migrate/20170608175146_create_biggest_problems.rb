class CreateBiggestProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :biggest_problems do |t|
      t.string :name

      t.timestamps
    end
  end
end
