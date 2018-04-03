require 'test_helper'

class MapControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get data" do
    get :data
    assert_response :success
  end

end
