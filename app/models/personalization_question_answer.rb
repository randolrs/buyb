class PersonalizationQuestionAnswer < ApplicationRecord

	belongs_to :personalization_question

	has_many :user_question_answers 


	def next_question_display_id

		if self.next_question_id

			if PersonalizationQuestion.where(:id => self.next_question_id)

				question = PersonalizationQuestion.find(self.next_question_id)

				if question

					
					return question.display_id

				else

					
					return nil

				end

			else

				
				return nil

			end

		else
			
			return nil

		end


	end

end
