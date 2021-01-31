require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  setup do
    @page = pages(:one)
  end

  test "visiting the index" do
    visit pages_url
    assert_selector "h1", text: "Pages"
  end

  test "creating a Page" do
    visit pages_url
    click_on "New Page"

    fill_in "About text", with: @page.about_text
    fill_in "About title", with: @page.about_title
    check "Active" if @page.active
    fill_in "Contact number", with: @page.contact_number
    fill_in "Contact title", with: @page.contact_title
    fill_in "Profile", with: @page.profile_id
    fill_in "Projects title", with: @page.projects_title
    fill_in "Services title", with: @page.services_title
    fill_in "Summary", with: @page.summary
    click_on "Create Page"

    assert_text "Page was successfully created"
    click_on "Back"
  end

  test "updating a Page" do
    visit pages_url
    click_on "Edit", match: :first

    fill_in "About text", with: @page.about_text
    fill_in "About title", with: @page.about_title
    check "Active" if @page.active
    fill_in "Contact number", with: @page.contact_number
    fill_in "Contact title", with: @page.contact_title
    fill_in "Profile", with: @page.profile_id
    fill_in "Projects title", with: @page.projects_title
    fill_in "Services title", with: @page.services_title
    fill_in "Summary", with: @page.summary
    click_on "Update Page"

    assert_text "Page was successfully updated"
    click_on "Back"
  end

  test "destroying a Page" do
    visit pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Page was successfully destroyed"
  end
end
