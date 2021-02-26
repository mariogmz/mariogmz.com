require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get new" do
    get new_admin_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post jobs_url, params: { job: { company_name: @job.company_name, description: @job.description, end_date: @job.end_date, profile_id: @job.profile_id, role: @job.role, start_date: @job.start_date } }
    end

    assert_redirected_to admin_job_url(Job.last)
  end

  test "should show job" do
    get admin_job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch admin_job_url(@job), params: { job: { company_name: @job.company_name, description: @job.description, end_date: @job.end_date, profile_id: @job.profile_id, role: @job.role, start_date: @job.start_date } }
    assert_redirected_to admin_job_url(@job)
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete admin_job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
