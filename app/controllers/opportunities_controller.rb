class OpportunitiesController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[show index]
  # skip_before_action :authenticate_artist!, only: %i[index]
  before_action :set_opportunities, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      tagsquery = params[:query].split
      @opportunities = Opportunity.joins(:tags).where(tags: {name: tagsquery} )
    else
      @opportunities = Opportunity.all
    end
  end

  def mine
    @opportunities = Opportunity.where(user: current_user)
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
    redirect_to opportunities_path, status: :see_other
  end

  private

  def opportunity_params
    params.require(:opportunity).permit(:title, :location, :description, :status, :photo)
  end

  def set_opportunities
    @opportunity = Opportunity.find(params[:id])
  end
end
