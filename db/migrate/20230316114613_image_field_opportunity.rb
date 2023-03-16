class ImageFieldOpportunity < ActiveRecord::Migration[7.0]
  def change
    add_column :opportunities, :opp_image, :string
  end
end
