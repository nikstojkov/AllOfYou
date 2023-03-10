class ShortlistedArtistsController < ApplicationController

  def create
    @shortlisted_artists = ShortlistedArtist.new
    @artist = Artist.find(params[:artist_id])
    @shortlisted_artists.artist = @artist
    @shortlisted_artists.shortlist = current_user.shortlists.first
    if @shortlisted_artists.save
      redirect_to shortlists_path(current_user)
    else
      redirect_to artist_path(@artist)
    end
  end

end


# artist_shortlisted_artists
