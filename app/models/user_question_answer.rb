class UserQuestionAnswer < ApplicationRecord

	belongs_to :user

	belongs_to :personalization_question

	belongs_to :personalization_question_answer

end
