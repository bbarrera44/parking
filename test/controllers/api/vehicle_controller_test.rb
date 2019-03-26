require 'test_helper'

class Api::VehicleControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get api_vehicle_all_url
    assert_response :success
  end

end
