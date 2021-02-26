require "test_helper"

module Admin
  class ControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:admin)
      sign_in(@user)
    end

    protected

    def signed_profile
      @user.profile
    end

    def test_image
      fixture_file_upload(Rails.root.join("public", "apple-touch-icon.png"), "image/png")
    end
  end
end
