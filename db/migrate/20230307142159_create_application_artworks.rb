class CreateApplicationArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :application_artworks do |t|
      t.references :artwork, null: false, foreign_key: true
      t.references :application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
