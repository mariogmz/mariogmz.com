module Admin
  class Controller < ::ApplicationController
    before_action :authenticate_user!

    protected
      def current_profile
        current_user.profile
      end
  end
end
