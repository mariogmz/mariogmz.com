class HomeController < ApplicationController
  before_action :set_page

  def index
  end

  def experience
  end

  def skills
  end

  private

  def set_page
    @page = Page.active.includes(:services, :projects, { profile: :user }).first
    @profile = @page.profile
  end
end
