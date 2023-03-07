class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: %i[show update edit]

  def show
    @opportunities = @user.opportunities
    @shortlists = @user.shortlists
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:location, :first_name, :last_name, :tags, :bio)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
