class Artwork < ApplicationRecord
  belongs_to :artist
  has_many :tags, through: :artwork_tags
  has_many :applications, through: :application_artworks
end
