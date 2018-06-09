require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get create" do
    get signup_path
    assert_response :success
  end


end
