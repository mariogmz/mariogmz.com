require "test_helper"
require_relative "./controller_test"

module Admin
  class DashboardControllerTest < ControllerTest
    test "creates a profile automatically if there's not one created" do
      sign_out(@user)
      new_user = User.create(email: "new_user@test.com", password: "test123!")
      sign_in(new_user)

      assert_nil(new_user.profile)

      get admin_dashboard_url

      assert_response :success
      assert_not_nil(new_user.profile)
    end
  end
end
