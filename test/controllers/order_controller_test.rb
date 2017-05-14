require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get add_offer_to_order" do
    get order_add_offer_to_order_url
    assert_response :success
  end

end
