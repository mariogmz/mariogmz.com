require "test_helper"
require_relative "./controller_test"


module Admin
  class PagesControllerTest < ControllerTest
    setup do
      @page = pages(:admin)
    end

    test "should get index" do
      get admin_pages_url
      assert_response :success
    end

    test "should get new" do
      get new_admin_page_url
      assert_response :success
    end

    test "should create page" do
      assert_difference('Page.count') do
        post admin_pages_url, params: { page: { about_text: @page.about_text, about_title: @page.about_title, active: @page.active, contact_number: @page.contact_number, contact_title: @page.contact_title, profile_id: @page.profile_id, projects_title: @page.projects_title, services_title: @page.services_title, summary: @page.summary } }
      end

      assert_redirected_to admin_page_url(Page.last)
    end

    test "should show page" do
      get admin_page_url(@page)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_page_url(@page)
      assert_response :success
    end

    test "should update page" do
      patch admin_page_url(@page), params: { page: { about_text: @page.about_text, about_title: @page.about_title, active: @page.active, contact_number: @page.contact_number, contact_title: @page.contact_title, profile_id: @page.profile_id, projects_title: @page.projects_title, services_title: @page.services_title, summary: @page.summary } }
      assert_redirected_to admin_page_url(@page)
    end

    test "should destroy page" do
      assert_difference('Page.count', -1) do
        delete admin_page_url(@page)
      end

      assert_redirected_to admin_pages_url
    end
  end

end
