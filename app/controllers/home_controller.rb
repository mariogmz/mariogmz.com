class HomeController < ApplicationController
  def index
    @page = Page.active.includes(:services, :projects).first
    @profile = @page.profile
  end
end
