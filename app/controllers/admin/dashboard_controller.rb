module Admin
  class DashboardController < Controller
    before_action :setup_profile

    def index
    end

    private
      def setup_profile
        @profile = current_user.profile || current_user.create_profile!
      end
  end
end
