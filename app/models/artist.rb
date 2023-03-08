class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :artist_tags
  has_many :tags, through: :artist_tags
  has_many :artworks
  has_many :applications
  has_many :opportunities, through: :applications
end
