class HomeController < ApplicationController
  before_action :set_page

  def index
  end

  def experience
    @jobs = @profile.jobs.order(start_date: :desc, end_date: :desc)
  end

  def skills
  end

  private

  def set_page
    @page = Page.active.includes(:services, :projects, { profile: [:user, :jobs] }).first
    @profile = @page.profile if @page.present?
  end
end
