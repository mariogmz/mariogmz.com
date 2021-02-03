module Admin
  class Controller < ::ApplicationController
    layout "admin"
    before_action :authenticate_user!

    protected
      def current_profile
        current_user.profile
      end
  end
end
