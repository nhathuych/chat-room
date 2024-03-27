class RoomsController < ApplicationController
  before_action :load_room, only: :show

  def index
    @rooms = Room.all
  end

  def show
    @rooms    = Room.all
    @messages = @room.messages.includes(:user)

    render :index
  end

  def create
    room = Room.new(room_params)

    if room.valid? && room.save
      @rooms = Room.all
      return render :index
    end

    redirect_to request.referer
  end

  private

  def load_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
