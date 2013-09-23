require 'test_helper'

class NewControllerTest < ActionController::TestCase
  test "should get sessions" do
    get :sessions
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
