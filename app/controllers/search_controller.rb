class SearchController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  skip_before_action :authenticate_artist!, only: %i[show index]
  def index
    if params[:query].present?
      tagsquery = params[:query].split
      @artists = Artist.joins(:tags).where(tags: {name: tagsquery} )
      @artworks = Artwork.joins(:tags).where(tags: {name: tagsquery} )
      @opportunities = Opportunity.joins(:tags).where(tags: {name: tagsquery} )
    else
      @artists = Artist.all
      @artworks = Artwork.all
      @opportunities = Opportunity.all
    end
  end

  def show

  end
end
