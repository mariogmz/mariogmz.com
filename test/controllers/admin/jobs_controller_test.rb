require "test_helper"

module Admin
  class JobsControllerTest < ControllerTest
    setup do
      @job = jobs(:current)
    end

    test "should create job" do
      assert_difference ->{ signed_profile.jobs.count } do
        post admin_jobs_url, params: { job: { company_name: @job.company_name, description: @job.description, end_date: @job.end_date, role: @job.role, start_date: @job.start_date } }
      end

      assert_redirected_to admin_experience_url
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
      patch admin_job_url(@job), params: { job: { company_name: @job.company_name, description: @job.description, end_date: @job.end_date, role: @job.role, start_date: @job.start_date } }
      assert_redirected_to admin_job_url(@job)
    end

    test "should destroy job" do
      assert_difference ->{ signed_profile.jobs.count }, -1 do
        delete admin_job_url(@job)
      end

      assert_response :success
    end

    test "should purge images" do
      @job.company_logo.attach test_image
      assert_difference("ActiveStorage::Attachment.count", -1) do
        patch admin_job_url(@job), params: { job: { company_logo_delete: true } }
      end
    end
  end
end
