require 'test_helper'

class PersonalizationQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personalization_question = personalization_questions(:one)
  end

  test "should get index" do
    get personalization_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_personalization_question_url
    assert_response :success
  end

  test "should create personalization_question" do
    assert_difference('PersonalizationQuestion.count') do
      post personalization_questions_url, params: { personalization_question: { additional_text: @personalization_question.additional_text, question: @personalization_question.question } }
    end

    assert_redirected_to personalization_question_url(PersonalizationQuestion.last)
  end

  test "should show personalization_question" do
    get personalization_question_url(@personalization_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_personalization_question_url(@personalization_question)
    assert_response :success
  end

  test "should update personalization_question" do
    patch personalization_question_url(@personalization_question), params: { personalization_question: { additional_text: @personalization_question.additional_text, question: @personalization_question.question } }
    assert_redirected_to personalization_question_url(@personalization_question)
  end

  test "should destroy personalization_question" do
    assert_difference('PersonalizationQuestion.count', -1) do
      delete personalization_question_url(@personalization_question)
    end

    assert_redirected_to personalization_questions_url
  end
end
