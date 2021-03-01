require "test_helper"
require_relative "./controller_test"

module Admin
  class SocialsControllerTest < ControllerTest
    setup do
      @social = socials(:github)
    end

    test "should create social" do
      assert_difference ->{ signed_profile.socials.count } do
        post admin_socials_url, params: { social: { name: @social.name, url: @social.url } }
      end

      assert_redirected_to edit_admin_profile_url
    end

    test "should show social" do
      get admin_social_url(@social)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_social_url(@social)
      assert_response :success
    end

    test "should update social" do
      patch admin_social_url(@social), params: { social: { name: @social.name, url: @social.url } }
      assert_redirected_to admin_social_url(@social)
    end

    test "should destroy social" do
      assert_difference ->{ signed_profile.socials.count }, -1 do
        delete admin_social_url(@social)
      end

      assert_response :success
    end

    test "should purge images" do
      @social.icon.attach test_image
      assert_difference("ActiveStorage::Attachment.count", -1) do
        delete admin_social_url(@social), params: { social: { icon_delete: true } }
      end
    end
  end
end
