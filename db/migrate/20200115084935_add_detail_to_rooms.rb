class AddDetailToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :detail, :text
  end
end
