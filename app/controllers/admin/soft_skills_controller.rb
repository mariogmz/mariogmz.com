module Admin
  class SoftSkillsController < Controller
    before_action :set_soft_skill, only: %i[show edit update destroy]

    def show
    end

    def edit
    end

    def create
      @soft_skill = current_profile.soft_skills.new(soft_skill_params)

      if @soft_skill.save
        redirect_to admin_experience_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def update
      @soft_skill.icon.purge if purge_icon?
      if @soft_skill.update(soft_skill_params)
        redirect_to [:admin, @soft_skill]
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @soft_skill.destroy
      render turbo_stream: ""
    end

    private
      def set_soft_skill
        @soft_skill = current_profile.soft_skills.find(params[:id])
      end

      def purge_icon?
        params.require(:soft_skill)[:icon_delete]
      end

      def soft_skill_params
        params.require(:soft_skill).permit(:name, :icon)
      end
  end
end
