require "test_helper"

class FitnessCentersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fitness_centers_index_url
    assert_response :success
  end
end
