require "application_system_test_case"

class SocialsTest < ApplicationSystemTestCase
  setup do
    @social = socials(:one)
  end

  test "visiting the index" do
    visit socials_url
    assert_selector "h1", text: "Socials"
  end

  test "creating a Social" do
    visit socials_url
    click_on "New Social"

    fill_in "Name", with: @social.name
    fill_in "Profile", with: @social.profile_id
    fill_in "Url", with: @social.url
    click_on "Create Social"

    assert_text "Social was successfully created"
    click_on "Back"
  end

  test "updating a Social" do
    visit socials_url
    click_on "Edit", match: :first

    fill_in "Name", with: @social.name
    fill_in "Profile", with: @social.profile_id
    fill_in "Url", with: @social.url
    click_on "Update Social"

    assert_text "Social was successfully updated"
    click_on "Back"
  end

  test "destroying a Social" do
    visit socials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Social was successfully destroyed"
  end
end
