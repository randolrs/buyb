class AddDisplayIdToPersonalizationQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :personalization_questions, :display_id, :string
  end
end
