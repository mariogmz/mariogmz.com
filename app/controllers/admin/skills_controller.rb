module Admin
  class SkillsController < Controller
    before_action :set_skill, only: %i[show edit update destroy]
    before_action :set_categories, only: %i[create edit update]

    def show
    end

    def edit
    end

    def create
      @skill = current_profile.skills.new(skill_params)
      if @skill.save
        redirect_to admin_experience_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def update
      if @skill.update(skill_params)
        redirect_to [:admin, @skill]
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @skill.destroy
    end

    private

    def set_skill
      @skill = current_profile.skills.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    def skill_params
      params.require(:skill).permit(
        :category_id, :name, :expertise
      )
    end
  end
end
