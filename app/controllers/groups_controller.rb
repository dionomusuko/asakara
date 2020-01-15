class GroupsController < ApplicationController
  def create
    user = current_user
    room = Room.find(params[:room_id])
    if Group.create(user_id: user.id, room_id: room.id)
      redirect_to rooms_path, notice: "#{room.title}にjoinしました"
    else
      redirect_to rooms_path
    end

  end

  def destroy
    user = current_user
    room = Room.find(params[:room_id])
    if group = Group.find_by(user_id: user.id, room_id: room.id)
      group.delete
      redirect_to rooms_path
    else
      redirect_to rooms_path
    end
  end
end
