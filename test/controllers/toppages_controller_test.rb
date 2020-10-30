require 'test_helper'

class ToppagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get toppages_home_url
    assert_response :success
  end

end
