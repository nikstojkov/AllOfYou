class SetDefaultValueForSuccess < ActiveRecord::Migration[7.0]
  def change
    change_column :applications, :success, :boolean, default: false
  end
end
