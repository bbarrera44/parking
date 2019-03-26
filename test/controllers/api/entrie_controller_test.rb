require 'test_helper'

class Api::EntrieControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get api_entrie_all_url
    assert_response :success
  end

end
