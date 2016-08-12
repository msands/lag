class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  protected

  def find_event
    @event = Event.find(params[:id])
  end

  def events_params
    params.requrie(:event).permit(:title, :description, :date, :time_start, :time_end, :address, :state, :zip_code, :event_organizer, :dress_code, :price, :food_provided, :notes)
  end
end
