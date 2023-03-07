class ArtworksController < ApplicationController
  def new
    @artwork = Artwork.new
  end

  def create
    artwork = Artwork.new(artwork_params)
    redirect_to artwork_path(artwork)
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :genre, :tags)
  end
end
