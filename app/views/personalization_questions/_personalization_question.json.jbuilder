json.extract! personalization_question, :id, :question, :additional_text, :created_at, :updated_at
json.url personalization_question_url(personalization_question, format: :json)