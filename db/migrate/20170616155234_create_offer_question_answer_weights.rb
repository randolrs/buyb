class CreateOfferQuestionAnswerWeights < ActiveRecord::Migration[5.0]
  def change
    create_table :offer_question_answer_weights do |t|
      t.integer :personalization_question_id
      t.integer :personalization_question_answer_id
      t.integer :offer_id
      t.decimal :weight

      t.timestamps
    end
  end
end
