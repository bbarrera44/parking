require 'test_helper'

class Api::EntryControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get api_entry_all_url
    assert_response :success
  end

end
