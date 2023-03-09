class Artwork < ApplicationRecord
  belongs_to :artist
  has_many :artwork_tags, dependent: :destroy
  has_many :tags, through: :artwork_tags
  has_many :application_artworks, dependent: :destroy
  has_many :applications, through: :application_artworks

  has_one_attached :photo
end
