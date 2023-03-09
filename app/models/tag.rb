class Tag < ApplicationRecord
  # has_many :artists, through: :artist_tags
  has_many :artist_tags, dependent: :destroy
  has_many :artwork_tags, dependent: :destroy
  has_many :opportunity_tags, dependent: :destroy

  validates :name, uniqueness: true
end
