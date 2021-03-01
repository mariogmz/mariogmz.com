require "application_system_test_case"

class SoftSkillsTest < ApplicationSystemTestCase
  setup do
    @soft_skill = soft_skills(:one)
  end

  test "visiting the index" do
    visit soft_skills_url
    assert_selector "h1", text: "Soft Skills"
  end

  test "creating a Soft skill" do
    visit soft_skills_url
    click_on "New Soft Skill"

    fill_in "Name", with: @soft_skill.name
    fill_in "Profile", with: @soft_skill.profile_id
    click_on "Create Soft skill"

    assert_text "Soft skill was successfully created"
    click_on "Back"
  end

  test "updating a Soft skill" do
    visit soft_skills_url
    click_on "Edit", match: :first

    fill_in "Name", with: @soft_skill.name
    fill_in "Profile", with: @soft_skill.profile_id
    click_on "Update Soft skill"

    assert_text "Soft skill was successfully updated"
    click_on "Back"
  end

  test "destroying a Soft skill" do
    visit soft_skills_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Soft skill was successfully destroyed"
  end
end
