class RoomsController < ApplicationController
  before_action :load_room, only: [:show]

  def index
    @rooms = Room.all
  end

  def show
    @rooms = Room.all
    render :index
  end

  def create
    if Room.create(room_params)
      @rooms = Room.all
      return render :index
    end
    render :new
  end

  private

  def load_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
