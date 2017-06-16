class CreateUserQuestionAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_question_answers do |t|
      t.integer :personalization_question_id
      t.integer :user_id
      t.integer :personalization_question_answer_id

      t.timestamps
    end
  end
end
