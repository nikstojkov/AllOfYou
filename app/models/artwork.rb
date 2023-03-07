class Artwork < ApplicationRecord
<<<<<<< HEAD
=======
  belongs_to :artist
<<<<<<< HEAD
>>>>>>> 239a79aac3a8b79b016ef53338257c94f42c2f78
=======
  has_many :tags, through: :artwork_tags
  has_many :applications, through: :application_artworks
>>>>>>> 31c7a2cc8857fd99a9a878ac07ef366e9b90a098
end
