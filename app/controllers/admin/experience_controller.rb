module Admin
  class ExperienceController < Controller
    def index
      @jobs = current_profile.jobs.all
      @new_job = current_profile.jobs.new
    end
  end
end
