class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    
  end
end
