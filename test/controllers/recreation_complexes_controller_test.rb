require "test_helper"

class RecreationComplexesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recreation_complexes_index_url
    assert_response :success
  end
end
