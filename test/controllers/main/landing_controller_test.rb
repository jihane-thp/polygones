require 'test_helper'

class Main::LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get main_landing_index_url
    assert_response :success
  end

  test "should get show" do
    get main_landing_show_url
    assert_response :success
  end

end
