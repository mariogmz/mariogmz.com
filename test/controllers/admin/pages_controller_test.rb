require "test_helper"
require_relative "./controller_test"


module Admin
  class PagesControllerTest < ControllerTest
    setup do
      @page = pages(:admin)
      @page.update(active: false)
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
        post admin_pages_url, params: { page: { about_title: @page.about_title, active: @page.active, contact_number: @page.contact_number, contact_title: @page.contact_title, profile_id: @page.profile_id, projects_title: @page.projects_title, services_title: @page.services_title, summary: @page.summary } }
      end
      assert_redirected_to edit_admin_page_url(Page.first)
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
      patch admin_page_url(@page), params: { page: { about_title: @page.about_title, active: @page.active, contact_number: @page.contact_number, contact_title: @page.contact_title, profile_id: @page.profile_id, projects_title: @page.projects_title, services_title: @page.services_title, summary: @page.summary } }
      assert_redirected_to edit_admin_page_url(@page)
    end

    test "should destroy page" do
      assert_difference('Page.count', -1) do
        delete admin_page_url(@page)
      end

      assert_redirected_to admin_pages_url
    end

    test "should purge images" do
      @page.hero_image_big.attach test_image
      @page.about_image.attach test_image
      @page.contact_image.attach test_image
      assert_difference("ActiveStorage::Attachment.count", -3) do
        patch admin_page_url(@page, params: { page: { hero_image_big_delete: true, about_image_delete: true, contact_image_delete: true }})
      end
    end
  end

end
