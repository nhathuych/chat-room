class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    message.save if message.valid?

    SendMessageJob.perform_later(message)
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :body)
  end
end
