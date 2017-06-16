class CreatePersonalizationQuestionAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :personalization_question_answers do |t|
      t.integer :question_id
      t.text :answer_text
      t.integer :next_question_id

      t.timestamps
    end
  end
end
