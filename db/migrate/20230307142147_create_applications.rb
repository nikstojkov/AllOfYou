class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.references :opportunity, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.text :content
      t.boolean :success

      t.timestamps
    end
  end
end
