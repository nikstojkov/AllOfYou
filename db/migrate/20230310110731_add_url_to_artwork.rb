class AddUrlToArtwork < ActiveRecord::Migration[7.0]
  def change
    add_column :artworks, :image_url, :string
  end
end
