class CreateShortlistedArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :shortlisted_artists do |t|
      t.references :shortlist, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
