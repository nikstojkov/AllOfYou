class ArtworksController < ApplicationController
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
    @artwork = Artwork.find(params[:id])
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    redirect_to artwork_path(artwork)
  end

  def delete
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to artworks_path, status: see_other
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :genre, :tags)
  end
end
