require 'test_helper'

class ImageControllerControllerTest < ActionController::TestCase
  test "should get store_image" do
    get :store_image
    assert_response :success
  end

end
