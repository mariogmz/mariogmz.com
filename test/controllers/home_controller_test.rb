require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get experience" do
    get experience_url
    assert_response :success
  end

  test "should get skills" do
    get skills_url
    assert_response :success
  end
end
