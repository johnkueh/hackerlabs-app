class AddDeviceIdAndCheckInCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :device_id, :string
    add_column :users, :check_in_count, :integer
  end
end
