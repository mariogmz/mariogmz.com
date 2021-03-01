module Admin
  class ExperienceController < Controller
    def index
      @jobs = current_profile.jobs.all
      @new_job = current_profile.jobs.new
      @skills = current_profile.skills.includes(:category).all
      @new_skill = current_profile.skills.new
      @categories = Category.order(order: :asc).all
      @new_category = Category.new
      @soft_skills = current_profile.soft_skills.all
      @new_soft_skill = current_profile.soft_skills.new
    end
  end
end
