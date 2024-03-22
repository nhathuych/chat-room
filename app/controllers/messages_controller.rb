class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    message.save if message.valid?

    redirect_to request.referer
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :body)
  end
end
