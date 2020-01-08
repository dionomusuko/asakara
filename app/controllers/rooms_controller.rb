class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    set_room
  end

  def new
  end

  def create
    if current_user
      @room = Room.new(room_params)
      if @room.save
        redirect_to rooms_path, notice: "ルーム「#{@room.name}」を登録しました。"
      else
        render :index
      end
    else
      redirect_to root_path, notice: "ログインしてください"
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
