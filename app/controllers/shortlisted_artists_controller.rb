class ShortlistedArtistsController < ApplicationController

  def create
    @shortlisted_artists = ShortlistedArtist.new
    @artist = Artist.find(params[:artist_id])
    @shortlisted_artists.artist = @artist
    @shortlisted_artists.shortlist = current_user.shortlists.first
    if @shortlisted_artists.save
      redirect_to shortlists_path(@shortlist)
    else
      redirect_to shortlist_path(@shortlist)
    end
  end

end


# artist_shortlisted_artists
