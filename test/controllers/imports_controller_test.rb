require 'test_helper'

class ImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get imports_index_url
    assert_response :success
  end

end
