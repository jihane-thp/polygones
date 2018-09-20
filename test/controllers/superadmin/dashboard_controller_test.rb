require 'test_helper'

class Superadmin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get superadmin_dashboard_index_url
    assert_response :success
  end

end
