require "test_helper"

module Admin
  class ControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:admin)
      sign_in(@user)
    end
  end
end
