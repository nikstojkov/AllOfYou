class AddDateAndStatusToOpportunities < ActiveRecord::Migration[7.0]
  def change
    add_column :opportunities, :date, :date

    remove_column :opportunities, :status, :string
    add_column :opportunities, :status, :boolean, default: true
  end
end
