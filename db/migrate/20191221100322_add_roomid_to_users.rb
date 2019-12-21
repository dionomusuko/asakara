class AddRoomidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :room, index: true
  end
end
