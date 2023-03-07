class OpportunitiesController < ApplicationController
  before_action :set_opportunities, only: %i[show edit update destroy]
  def index
    @opportunities = Opportunities.all
  end

  def new
    @opportunity = Opportunities.new
  end

  def create
    opportunities = Opportunities.new(opportunity_params)
    opportunities.save
    redirect_to opportunity_path(opportunities)
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def opportunity_params
    params.require(:opportunity).permit(:title, :location, :description, :status)
  end

  def set_opportunities
    @opportunity = Opportunities.find(params[:id])
  end
end
