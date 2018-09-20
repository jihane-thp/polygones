require 'test_helper'

class Web::NatureControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_nature_index_url
    assert_response :success
  end

  test "should get accueil" do
    get web_nature_accueil_url
    assert_response :success
  end

  test "should get blog" do
    get web_nature_blog_url
    assert_response :success
  end

end
