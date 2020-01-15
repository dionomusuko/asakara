class RoomsController < ApplicationController
  def index
    if current_user
      @rooms = Room.all
    else
      redirect_to root_path, notice: "ログインしてください"
    end
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

  def destroy
    set_room
    @room.destroy
    redirect_to rooms_path, notice: "投稿「#{@room.title}」を削除しました"
  end

  def edit
  end

  #def join
   # set_room
    #Group.new(@room.id, current_user.id)
    #Group.save
  #end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:title)
  end
end
