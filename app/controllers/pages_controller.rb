class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @new_tag = params[:newtag] if params[:newtag]
    # @tag = Tag.create(name: @new_tag)
    ArtistTag.create(tag: @tag, artist: current_artist)
    @current_tags = current_artist.tags

    @all_current_tags = Tag.all
    @new_tags = params[:tags]
    @new_tags.each { |tag| Tag.create(name: tag)}
  end
end
