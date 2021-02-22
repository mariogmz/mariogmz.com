require "test_helper"

class ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service = services(:software_engineering)
  end

  test "should create service" do
    assert_difference('Service.count') do
      post admin_page_services_url(@service.page), params: { service: { description: @service.description, name: @service.name, page_id: @service.page_id } }
    end

    assert_redirected_to edit_admin_page_url(Service.last.page)
  end

  test "should show service" do
    get admin_service_url(@service)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_service_url(@service)
    assert_response :success
  end

  test "should update service" do
    patch admin_service_url(@service), params: { service: { description: @service.description, name: @service.name, page_id: @service.page_id } }
    assert_redirected_to admin_service_url(@service)
  end

  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete admin_service_url(@service)
    end

    assert_response :no_content
  end
end
