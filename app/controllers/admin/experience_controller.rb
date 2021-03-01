module Admin
  class ExperienceController < Controller
    def index
      @jobs = current_profile.jobs.all
      @new_job = current_profile.jobs.new
      @skills = current_profile.skills.includes(:category).all
      @new_skill = current_profile.skills.new
      @categories = Category.order(order: :asc).all
      @new_category = Category.new
    end
  end
end
