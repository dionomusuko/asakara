class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    set_room
  end

  def new
  end

  def edit
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

end
