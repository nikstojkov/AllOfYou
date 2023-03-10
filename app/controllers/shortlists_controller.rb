class ShortlistsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  skip_before_action :authenticate_artist!, only: %i[index]
  before_action :set_shortlist, only: %i[show edit update destroy]


  def index
    @shortlists = Shortlist.where(user: current_user)
    # @shortlists = Shortlist.all
  end

  def new
    @shortlist = Shortlist.new
  end

  def create
    @shortlist = Shortlist.new(shortlist_params)
    @shortlist.user = current_user
    if @shortlists.save
      redirect_to shortlist_path(@shortlist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @shortlist.update(shortlist_params)
    redirect_to shortlist_path(@shortlist)
  end

  def destroy
    @shortlist.destroy
    redirect_to shortlists_path
  end

  private

  def set_shortlist
    @shortlist = Shortlist.find(params[:id])
  end

  def shortlist_params
    params.require(:shortlist).permit(:name)
  end
end
