class AddPersonalizationQuestionToPersonalizationQuestionAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :personalization_question_answers, :personalization_question_id, :integer
  end
end
