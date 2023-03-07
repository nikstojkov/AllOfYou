class ApplicationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_opportunity, only: [:new]

  def index
    @applications = Application.all
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.opportunity = @opportunity
    @application.save
    if @application.save
      redirect_to opportunity_path(@opportunity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @application = Application.find(params[:application_id])
  end

  def delete
    @review.destroy
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
