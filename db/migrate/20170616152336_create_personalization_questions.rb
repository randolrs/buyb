class CreatePersonalizationQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :personalization_questions do |t|
      t.text :question
      t.text :additional_text

      t.timestamps
    end
  end
end
