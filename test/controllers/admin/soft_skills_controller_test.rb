require "test_helper"
require_relative "./controller_test"

module Admin
  class SoftSkillsControllerTest < ControllerTest
    setup do
      @soft_skill = soft_skills(:community_driven)
    end

    test "should create soft_skill" do
      assert_difference ->{ signed_profile.soft_skills.count } do
        post admin_soft_skills_url, params: { soft_skill: { name: @soft_skill.name } }
      end

      assert_redirected_to admin_experience_url
    end

    test "should show soft_skill" do
      get admin_soft_skill_url(@soft_skill)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_soft_skill_url(@soft_skill)
      assert_response :success
    end

    test "should update soft_skill" do
      patch admin_soft_skill_url(@soft_skill), params: { soft_skill: { name: @soft_skill.name } }
      assert_redirected_to admin_soft_skill_url(@soft_skill)
    end

    test "should destroy soft_skill" do
      assert_difference ->{ signed_profile.soft_skills.count }, -1 do
        delete admin_soft_skill_url(@soft_skill)
      end

      assert_response :success
    end

    test "should purge images" do
      @soft_skill.icon.attach test_image
      assert_difference("ActiveStorage::Attachment.count", -1) do
        delete admin_soft_skill_url(@soft_skill), params: { soft_skill: { icon_delete: true } }
      end
    end
  end
end
