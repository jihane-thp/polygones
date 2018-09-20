require 'test_helper'

class SitesControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do
    @site = sites(:web)
    
  end

  test "should get index" do
    get sites_url
    assert_response :success
  end

  test "should get new" do
    get new_site_url
    assert_response :success
  end

  test "should create site" do
    assert_difference('Site.count') do
      sign_in users(:one)
      post sites_url, params: { site: { name: @site.name, slogan: @site.slogan, meta_description: @site.meta_description, meta_title: @site.meta_title } }
    end
    assert_redirected_to site_url(Site.last)
  end

  test "should show site" do
    get site_url(@site)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_url(@site)
    assert_response :success
  end

  # test "should update site" do
  #   patch site_url(@site), params: { site: { title: @site.title, content: @site.content } }
  #   assert_redirected_to site_url(@site)
  # end

end
