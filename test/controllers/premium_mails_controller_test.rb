require 'test_helper'

class PremiumMailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get premium_mails_new_url
    assert_response :success
  end

  test "should get create" do
    get premium_mails_create_url
    assert_response :success
  end

end
