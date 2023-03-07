class Application < ApplicationRecord
  belongs_to :opportunity
  belongs_to :artist
  has_many :artworks, through: :application_artworks
end
