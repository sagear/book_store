require 'test_helper'

class FevoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get Update" do
    get fevorites_Update_url
    assert_response :success
  end

end
