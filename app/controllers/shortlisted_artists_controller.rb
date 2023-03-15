class ShortlistedArtistsController < ApplicationController
  skip_before_action :authenticate_artist!

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

  # def destroy
  #   @shortlisted_artist.find(params[:id]).destroy
  #   redirect_to
  # end

end


# artist_shortlisted_artists
