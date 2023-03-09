class OpportunitiesController < ApplicationController
  before_action :set_opportunities, only: %i[show edit update]

  def index
    @opportunities = Opportunity.all
  end

  def show
    @applications = @opportunity.applications

    if params[:tags]
      @new_tags = params[:tags].split(", ")
      @new_tags.each do |tag|
        tag_create = Tag.find_or_create_by(name: tag)
        if @opportunity.tags.include?(tag_create) == false
          OpportunityTag.create(tag: tag_create, opportunity: @opportunity)
        end
        # end
      end
    end

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

  def edit
  end

  def update
    opportunity.update(opportunity_params)
    redirect_to opportunity_path(opportunity)
  end

  def destroy
    @opportunity = Opportunity.find(params[:id])
    @opportunity.destroy
    redirect_to opportunities_path
  end

  private

  def opportunity_params
    params.require(:opportunity).permit(:title, :location, :description, :status)
  end

  def set_opportunities
    @opportunity = Opportunity.find(params[:id])
  end
end
