class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_artist, only: %i[show update edit]

  def show
    @artworks = @artist.artworks
    @tags = @artist.tags
    @applications = @artist.applications
    @artist_opportunities = @artist.opportunities

    @created_tag = params[:selecttags] if params[:selecttags]
  end

  def edit
  end

  def update
    @artist.update(artist_params)
    redirect_to current_user
  end

  def destroy
    @artist.destroy
    redirect_to new_artist_registration
  end

  private

  def artist_params
    params.require(:artist).permit(:location, :first_name, :last_name, :tags, :bio)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
