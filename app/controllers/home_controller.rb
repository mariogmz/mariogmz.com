class HomeController < ApplicationController
  def index
    @page = Page.active.includes(:services).first
    @profile = @page.profile
  end
end
