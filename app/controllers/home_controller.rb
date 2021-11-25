class HomeController < ApplicationController
  before_action :authenticate_user!

  # controller for the index page

  def index
  end
end
