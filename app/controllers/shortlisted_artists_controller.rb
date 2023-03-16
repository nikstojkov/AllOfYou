class ShortlistedArtistsController < ApplicationController
  skip_before_action :authenticate_artist!

  def create
    shortlist = current_user.shortlist

    @shortlisted_artists = ShortlistedArtist.new
    @artist = Artist.find(params[:artist_id])
    @shortlisted_artists.artist = @artist
    @shortlisted_artists.shortlist = current_user.shortlist
    if @shortlisted_artists.save
      redirect_to shortlist_path(shortlist)
    else
      redirect_to artist_path(@artist)
    end
  end

  def destroy
    raise
    @shortlisted_artist = ShortlistedArtist.find(params[:id])
    @shortlisted_artist.destroy
    redirect_to shortlist_path(current_user.shortlist)
  end

end


# artist_shortlisted_artists
