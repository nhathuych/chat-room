class RoomChannel < ApplicationCable::Channel
  def subscribed
    # created a new channel, its name could be: "activity_channel_1" or "activity_channel_2" or "activity_channel_3"
    # clients have to connect to this channel with their param (room_id)
    # in case their param is room_id = 1, they have to connect to "activity_channel_1" and couldn't connect to "activity_channel_2" or "activity_channel_3"
    stream_from "room_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
