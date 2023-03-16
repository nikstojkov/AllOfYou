class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_before_action :authenticate_artist!, only: [:home]

  def home
    @artist = Artist.all.sample
  end
end
