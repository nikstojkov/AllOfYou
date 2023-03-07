class Shortlist < ApplicationRecord
  belongs_to :user
  has_many :shortlisted_artists, dependent: :destroy
  has_many :artists, through: :shortlisted_artists
end
