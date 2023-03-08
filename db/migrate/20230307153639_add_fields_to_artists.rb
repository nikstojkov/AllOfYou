class AddFieldsToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :first_name, :string
    add_column :artists, :last_name, :string
    add_column :artists, :bio, :text
    add_column :artists, :location, :string
    add_column :artists, :pronouns, :string
  end
end
