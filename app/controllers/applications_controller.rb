class ApplicationsController < ApplicationController

  before_action :set_opportunity, only: %i[new create]

  def index
    @applications = Application.where(artist: current_artist)
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.opportunity = @opportunity
    @application.artist = current_artist
    if @application.save
      redirect_to opportunity_path(@opportunity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @application = Application.find(params[:id])
  end

  def delete
    @application.destroy
    redirect_to opportunity_path(@opportunity)
  end

  private

  def set_opportunity
    @opportunity = Opportunity.find(params[:opportunity_id])
  end

  def application_params
    params.require(:application).permit(:content)
  end
end
