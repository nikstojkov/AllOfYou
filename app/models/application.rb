class Application < ApplicationRecord
  belongs_to :opportunity
  belongs_to :artist
  has_many :application_artworks, dependent: :destroy
  has_many :artworks, through: :application_artworks
end
