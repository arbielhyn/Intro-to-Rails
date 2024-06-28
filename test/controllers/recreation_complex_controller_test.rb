require "test_helper"

class RecreationComplexControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get recreation_complex_show_url
    assert_response :success
  end
end
