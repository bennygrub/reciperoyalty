require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  test "should get after_sign_up_path_for" do
    get :after_sign_up_path_for
    assert_response :success
  end

end
