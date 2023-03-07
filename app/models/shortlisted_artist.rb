class ShortlistedArtist < ApplicationRecord
  belongs_to :shortlist
  belongs_to :artist
end
