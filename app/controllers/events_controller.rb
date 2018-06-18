class EventsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @event_users = @event.invites.where(invite_status: 'Accepted').pluck(:attendee_id)
    @attendees = User.where(id: @event_users)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to @event
    else
      flash.now[:warning] = "Unable to create Event"
      render 'new'
    end
  end

  private


  def event_params
    params.require(:event).permit(:title, :description, :date, :event_photo)
  end





end
