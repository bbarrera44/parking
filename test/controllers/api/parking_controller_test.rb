require 'test_helper'

class Api::ParkingControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get api_parking_all_url
    assert_response :success
  end

end
