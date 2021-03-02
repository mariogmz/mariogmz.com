module Admin
  class LanguagesController < Controller
    before_action :set_language, only: %i[show edit update destroy]
    def show
    end

    def edit
    end

    def create
      @language = current_profile.languages.new(language_params)

      if @language.save
        redirect_to edit_admin_profile_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def update
      if @language.update(language_params)
        redirect_to [:admin, @language]
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @language.destroy
      render turbo_stream: ""
    end

    private
      def set_language
        @language = current_profile.languages.find(params[:id])
      end

      def language_params
        params.require(:language).permit(:name, :level)
      end
  end

end
