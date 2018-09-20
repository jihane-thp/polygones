  require 'test_helper'

  

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @category = categories(:one, :two)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

	test "should create category" do
	    assert_difference('Category.count') do
	      post categories_url, params: { category: { title: "hello" } }
	    end
        assert_redirected_to category_url(Category.last)
	end
 
  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { title: "updated" } }
    assert_redirected_to category_path(@category)
  end


  test "should destroy category" do
      delete category_url(@category)
    assert_redirected_to categories_url
  end
end
