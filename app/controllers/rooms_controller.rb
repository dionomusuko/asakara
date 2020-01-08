class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    set_room
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: "ルーム「#{@room.title}」を登録しました。"
    else
      render :index, notice: "ルーム「#{@room.title}」を登録できませんでした。"
    end
  end

  def edit
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:title)
  end
end
