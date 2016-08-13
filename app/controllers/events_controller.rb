class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: :new

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    @event.user =current_user
    if @event.save
      redirect_to @event, notice: "Event created!"
    else
      flash[:error] = "Oops, something isn't right"
      render "new"
    end
  end

  protected

  def find_event
    @event = Event.find(params[:id])
  end

  def events_params
    params.require(:event).permit(:title, :description, :date, :time_start, :time_end, :address, :state, :zip_code, :event_organizer, :dress_code, :price, :food_provided, :notes)
  end
end
