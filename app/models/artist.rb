class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :artist_tags, dependent: :destroy
  has_many :tags, through: :artist_tags
  has_many :artworks, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :opportunities, through: :applications

  has_one_attached :photo
end
