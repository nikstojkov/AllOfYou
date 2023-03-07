class ArtworksController < ApplicationController
  before_action :set_artwork, only: %i[show edit update destroy]
  def index
    @artworks = Artwork.all
  end

  def new
    @artwork = Artwork.new
  end

  def create
    artwork = Artwork.new(artwork_params)
    artwork.save
    redirect_to artwork_path(artwork)
  end

  def show
  end

  def edit
  end

  def update
    artwork.update(artwork_params)
    redirect_to artwork_path(artwork)
  end

  def delete
    @artwork.destroy
    redirect_to artworks_path, status: see_other
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :genre)
  end

  def set_artwork
    @artwork = Artwork.find(params[:id])
  end
end
