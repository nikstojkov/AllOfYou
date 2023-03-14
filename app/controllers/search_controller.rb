class SearchController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  skip_before_action :authenticate_artist!, only: %i[show index]
  def index
    if params[:query].present?
      tagsquery = params[:query].split
      @artists = ordered_results(Artist.joins(:tags).where(tags: {name: tagsquery} ).uniq)
      @artworks = ordered_results(Artwork.joins(:tags).where(tags: {name: tagsquery} ).uniq)
      @opportunities = ordered_results(Opportunity.joins(:tags).where(tags: {name: tagsquery} ).uniq)
    else
      @artists = Artist.all
      @artworks = Artwork.all
      @opportunities = Opportunity.all
    end
  end

  def show

  end

  private

  def num_matches(model)
    (params[:query].split & model.tags.map(&:name)).size
  end

  def ordered_results(models)
    models.sort_by {|model| num_matches(model)}.reverse
  end
end
