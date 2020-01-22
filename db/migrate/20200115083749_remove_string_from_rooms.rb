class RemoveStringFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :string, :string
    remove_column :rooms, :string, :string
  end
end
