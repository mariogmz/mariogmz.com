require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "creating a Job" do
    visit jobs_url
    click_on "New Job"

    fill_in "Company name", with: @job.company_name
    check "Current" if @job.current
    fill_in "Description", with: @job.description
    fill_in "End date", with: @job.end_date
    fill_in "Profile", with: @job.profile_id
    fill_in "Role", with: @job.role
    fill_in "Start date", with: @job.start_date
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit jobs_url
    click_on "Edit", match: :first

    fill_in "Company name", with: @job.company_name
    check "Current" if @job.current
    fill_in "Description", with: @job.description
    fill_in "End date", with: @job.end_date
    fill_in "Profile", with: @job.profile_id
    fill_in "Role", with: @job.role
    fill_in "Start date", with: @job.start_date
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
