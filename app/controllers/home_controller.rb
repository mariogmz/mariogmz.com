class HomeController < ApplicationController
  def index
    @page = Page.active.first
    @profile = @page.profile
  end
end
