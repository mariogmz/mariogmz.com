class HomeController < ApplicationController
  def index
    @page = Page.active.includes(:services, :projects, { profile: :user }).first
    @profile = @page.profile
  end
end
