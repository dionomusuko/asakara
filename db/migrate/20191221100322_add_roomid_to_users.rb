class AddRoomidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :room, null: false, index: true
  end
end
