require "test_helper"
require_relative "./controller_test"

module Admin
  class SkillsControllerTest < ControllerTest
    setup do
      @skill = skills(:ruby)
    end

    test "should create skill" do
      assert_difference ->{ Skill.count } do
        post admin_skills_url, params: { skill: { name: @skill.name, expertise: @skill.expertise, category_id: @skill.category.id, profile_id: signed_profile.id } }
      end

      assert_redirected_to admin_experience_url
    end

    test "should show skill" do
      get admin_skill_url(@skill)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_skill_url(@skill)
      assert_response :success
    end

    test "should update skill" do
      patch admin_skill_url(@skill), params: { skill: { name: @skill.name, expertise: @skill.expertise, category_id: @skill.category.id } }
      assert_redirected_to admin_skill_url(@skill)
    end

    test "should destroy skill" do
      assert_difference ->{ Skill.count }, -1 do
        delete admin_skill_url(@skill)
      end

      assert_response :success
    end
  end
end
