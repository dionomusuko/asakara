class ChatRoomsController < ApplicationController
  def show
    @chats = Chat.all
  end
end
