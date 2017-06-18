class PersonalizationQuestion < ApplicationRecord

  	has_many :personalization_question_answers

  	has_many :user_question_answers 
  	
  	accepts_nested_attributes_for :personalization_question_answers, allow_destroy: true

  	def self.initial_question

  		initial_question = PersonalizationQuestion.where(:initial_question => true).last

  		if initial_question

  			return initial_question
  		else

  			return PersonalizationQuestion.where(:active => true).first
  		end

  	end

end
