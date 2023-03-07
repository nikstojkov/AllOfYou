class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :genre
      t.string :tags

      t.timestamps
    end
  end
end
