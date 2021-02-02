module Admin
  class DashboardController < Controller
    before_action :setup_profile

    def index
      @page = current_profile.pages.order(active: :desc, updated_at: :desc).first
    end

    private
      def setup_profile
        @profile = current_profile || current_user.create_profile!
      end
  end
end
