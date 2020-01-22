class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    chat = Chat.create!(content: data['chat'])
    template = ApplicationController.renderer.render(partial: 'chats/chat', locals: {chat: chat})
    ActionCable.server.broadcast 'chat_channel', template
  end
end
