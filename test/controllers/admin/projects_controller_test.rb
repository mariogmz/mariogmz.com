require "test_helper"
require_relative "./controller_test"

module Admin
  class ProjectsControllerTest < ControllerTest
    setup do
      @project = projects(:todo)
    end

    test "should create project" do
      assert_difference('Project.count') do
        post admin_page_projects_url(@project.page), params: { project: {
          description: @project.description, name: @project.name, url: @project.url, page_id: @project.page_id
        } }
      end

      assert_redirected_to edit_admin_page_url(Project.last.page)
    end

    test "should show project" do
      get admin_project_url(@project)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_project_url(@project)
      assert_response :success
    end

    test "should update project" do
      patch admin_project_url(@project), params: { project: {
        description: @project.description, name: @project.name, url: @project.url
      } }
      assert_redirected_to admin_project_url(@project)
    end

    test "should destroy project" do
      assert_difference('Project.count', -1) do
        delete admin_project_url(@project)
      end

      assert_response :no_content
    end

    test "should purge images" do
      @project.image.attach test_image
      assert_difference("ActiveStorage::Attachment.count", -1) do
        patch admin_project_url(@project), params: { project: { image_delete: true } }
      end
    end
  end
end
