require "test_helper"
require_relative "./controller_test"

module Admin
  class CategoriesControllerTest < ControllerTest
    setup do
      @category = categories(:programming_languages)
    end

    test "should create category" do
      assert_difference ->{ Category.count } do
        post admin_categories_url, params: { category: { order: 3, name: "test" } }
      end

      assert_redirected_to admin_experience_url
    end

    test "should show category" do
      get admin_category_url(@category)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_category_url(@category)
      assert_response :success
    end

    test "should update category" do
      patch admin_category_url(@category), params: { category: { order: 1, name: "test" } }
      assert_redirected_to admin_category_url(@category)
    end

    test "should destroy category" do
      assert_difference ->{ Category.count }, -1 do
        delete admin_category_url(@category)
      end

      assert_response :success
    end
  end
end
