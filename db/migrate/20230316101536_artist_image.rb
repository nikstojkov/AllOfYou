class ArtistImage < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :profile_image, :string
  end
end
