class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.references :artist, null: false, foreign_key: true
      t.string :name
      t.string :genre

      t.timestamps
    end
  end
end
