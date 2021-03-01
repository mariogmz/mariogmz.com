module Admin
  class SocialsController < Controller
    before_action :set_social, only: %i[show edit update destroy]

    def show
    end

    def edit
    end

    def create
      @social = current_profile.socials.new(social_params)

      if @social.save
        redirect_to edit_admin_profile_path
      else
        render :edit
      end
    end

    def update
      @social.icon.purge if purge_image?
      if @social.update(social_params)
        redirect_to [:admin, @social]
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @social.destroy
      render turbo_stream: ""
    end

    private
      def set_social
        @social = Social.find(params[:id])
      end

      def purge_image?
        params.require(:social)[:icon_delete].present?
      end

      def social_params
        params.require(:social).permit(:name, :url, :icon)
      end
  end

end
