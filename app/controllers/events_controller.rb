class EventsController < ApplicationController
  before_action :check_logged_in, :only => [:new, :create]
  before_action :set_event, only: [:show]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    event_parmas = params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date)

    @event = Event.new(event_parmas)
    if @event.save
      flash[:komunikat] = 'Event został poprawnie stworzony.'
      redirect_to "/events/#{@event.id}"
    else
      render 'new'
    end
  end

  private

  def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username, password|
      username == "michal" && password == "michal"
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end
end