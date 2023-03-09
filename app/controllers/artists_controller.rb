class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_artist, only: %i[show update edit destroy]

  def index
    if params[:query].present?
      tagsquery = params[:query].split
      @artists = Artist.joins(:tags).where(tags: {name: tagsquery} )
    else
      @artists = Artist.all
    end
  end

  def show
    @artworks = @artist.artworks
    @tags = @artist.tags
    @applications = @artist.applications
    @artist_opportunities = @artist.opportunities
    # raise
    if params[:tags]
      @new_tags = params[:tags].split(", ")
      @new_tags.each do |tag|
        tag_create = Tag.find_or_create_by(name: tag)
        if current_artist.tags.include?(tag_create) == false
          ArtistTag.create(tag: tag_create, artist: current_artist)
        end
        # end
      end
    end
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
    params.require(:artist).permit(:location, :first_name, :last_name, :tags, :bio, :photo)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
