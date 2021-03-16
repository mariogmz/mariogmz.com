class HomeController < ApplicationController
  before_action :set_page

  def index
  end

  def experience
    @jobs = @profile.jobs.order(start_date: :desc, end_date: :desc)
  end

  def skills
    @skills =  @profile.skills.order(expertise: :desc).group_by { |skill| skill.category.name }
    @soft_skills = @profile.soft_skills
    @languages = @profile.languages
  end

  private

  def set_page
    @page = Page.active.includes(
      :services,
      :projects,
      { profile: [:user, :jobs, :soft_skills, :languages, { skills: :category }] }
    ).first
    @profile = @page.profile if @page.present?
  end
end
