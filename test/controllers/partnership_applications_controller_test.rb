require 'test_helper'

class PartnershipApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partnership_application = partnership_applications(:one)
  end

  test "should get index" do
    get partnership_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_partnership_application_url
    assert_response :success
  end

  test "should create partnership_application" do
    assert_difference('PartnershipApplication.count') do
      post partnership_applications_url, params: { partnership_application: { company_description: @partnership_application.company_description, company_name: @partnership_application.company_name, company_url: @partnership_application.company_url, contact_email: @partnership_application.contact_email, contact_name: @partnership_application.contact_name, contact_title: @partnership_application.contact_title, customer_service_staff: @partnership_application.customer_service_staff, product_description: @partnership_application.product_description, product_name: @partnership_application.product_name, product_why_is_great: @partnership_application.product_why_is_great } }
    end

    assert_redirected_to partnership_application_url(PartnershipApplication.last)
  end

  test "should show partnership_application" do
    get partnership_application_url(@partnership_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_partnership_application_url(@partnership_application)
    assert_response :success
  end

  test "should update partnership_application" do
    patch partnership_application_url(@partnership_application), params: { partnership_application: { company_description: @partnership_application.company_description, company_name: @partnership_application.company_name, company_url: @partnership_application.company_url, contact_email: @partnership_application.contact_email, contact_name: @partnership_application.contact_name, contact_title: @partnership_application.contact_title, customer_service_staff: @partnership_application.customer_service_staff, product_description: @partnership_application.product_description, product_name: @partnership_application.product_name, product_why_is_great: @partnership_application.product_why_is_great } }
    assert_redirected_to partnership_application_url(@partnership_application)
  end

  test "should destroy partnership_application" do
    assert_difference('PartnershipApplication.count', -1) do
      delete partnership_application_url(@partnership_application)
    end

    assert_redirected_to partnership_applications_url
  end
end
