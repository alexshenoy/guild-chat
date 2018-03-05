class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    @message = Message.new({user: data['user'], body: data['body']})
    if @message.save
      ActionCable.server.broadcast('messages',
                                   message: render_message)
    end
  end

    private

    def render_message
      ApplicationController.render(partial: 'messages/message', locals: {message: @message})
    end
end
