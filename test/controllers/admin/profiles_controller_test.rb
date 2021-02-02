require "test_helper"
require_relative "./controller_test"

module Admin
  class ProfilesControllerTest < ControllerTest
    setup do
      @profile = @user.profile
    end

    test "should get edit" do
      get edit_admin_profile_url(@profile)
      assert_response :success
    end
  end
end
