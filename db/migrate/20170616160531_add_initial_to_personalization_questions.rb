class AddInitialToPersonalizationQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :personalization_questions, :initial_question, :boolean
    add_column :personalization_questions, :active, :boolean
  end
end
