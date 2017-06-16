class PersonalizationQuestion < ApplicationRecord

  	has_many :personalization_question_answers

  	has_many :user_question_answers 
  	
  	accepts_nested_attributes_for :personalization_question_answers, allow_destroy: true

end
