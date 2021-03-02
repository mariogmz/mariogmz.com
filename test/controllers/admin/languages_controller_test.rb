require "test_helper"
require_relative "./controller_test"

module Admin
  class LanguagesControllerTest < ControllerTest
    setup do
      @language = languages(:es)
    end

    test "should create language" do
      assert_difference ->{ signed_profile.languages.count } do
        post admin_languages_url, params: { language: { level: @language.level, name: @language.name } }
      end

      assert_redirected_to edit_admin_profile_url
    end

    test "should show language" do
      get admin_language_url(@language)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_language_url(@language)
      assert_response :success
    end

    test "should update language" do
      patch admin_language_url(@language), params: { language: { level: @language.level, name: @language.name } }
      assert_redirected_to admin_language_url(@language)
    end

    test "should destroy language" do
      assert_difference -> { signed_profile.languages.count }, -1 do
        delete admin_language_url(@language)
      end

      assert_response :success
    end
  end

end
