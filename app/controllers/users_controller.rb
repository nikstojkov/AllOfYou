class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: %i[show update edit destroy]

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

  def destroy
    @user.destroy
    redirect_to new_user_registration
  end

  private

  def user_params
    params.require(:user).permit(:location, :first_name, :last_name, :bio, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
