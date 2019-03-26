require 'test_helper'

class Api::EntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get api_entries_all_url
    assert_response :success
  end

end
