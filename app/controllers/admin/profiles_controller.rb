module Admin
  class ProfilesController < Controller
    before_action :set_profile, only: %i[show edit update]

    def show
    end

    def edit
      @socials = current_profile.socials.all
      @new_social = current_profile.socials.new
    end

    def update
      if @profile.update(profile_params)
        redirect_to admin_dashboard_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private
      def set_profile
        @profile = current_user.profile
      end

      def profile_params
        params.require(:profile).permit(:first_name, :last_name, :role, :location, :visa, :realocation)
      end
  end
end
