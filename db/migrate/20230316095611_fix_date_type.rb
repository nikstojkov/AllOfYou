class FixDateType < ActiveRecord::Migration[7.0]
  def change
    remove_column :opportunities, :date, :date
    add_column :opportunities, :date, :date
  end
end
