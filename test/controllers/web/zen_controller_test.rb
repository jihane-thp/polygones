require 'test_helper'

class Web::ZenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_zen_index_url
    assert_response :success
  end

  test "should get show" do
    get web_zen_show_url
    assert_response :success
  end

end
