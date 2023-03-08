class RemoveTagsAndAddBioToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :tags, :string
    add_column :users, :bio, :text
    add_column :users, :pronouns, :string
  end
end
