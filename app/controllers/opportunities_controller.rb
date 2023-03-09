class OpportunitiesController < ApplicationController
  before_action :set_opportunities, only: %i[show edit update destroy]

  def index
    @opportunities = Opportunity.all
  end

  def new
    @opportunity = Opportunity.new
  end

  def create
    opportunity = Opportunity.new(opportunity_params)
    opportunity.user = current_user
    if opportunity.save
      redirect_to opportunity_path(opportunity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @applications = @opportunity.applications
  end

  def edit
  end

  def update
    opportunity.update(opportunity_params)
    redirect_to opportunity_path(opportunity)
  end

  def destroy
    @opportunity.destroy
    redirect_to opportunities_path, status: see_other
  end

  private

  def opportunity_params
    params.require(:opportunity).permit(:title, :location, :description, :status)
  end

  def set_opportunities
    @opportunity = Opportunity.find(params[:id])
  end
end
