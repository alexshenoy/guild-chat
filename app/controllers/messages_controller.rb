class MessagesController < ApplicationController
  def index
    @message = Message.new(user: user_from_param)
    @messages = Message.last(50)
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      render json: {status: 'success', message: @message}
    else
      render json: {status: 'error', error: @message.errors}
    end
  end

  def sign_in
  end


    private

    def message_params
      params.permit![:message]
    end

    def user_from_param
      params.permit![:user]
    end
end
