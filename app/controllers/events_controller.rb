class EventsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @invites = Invite.where({attended_event_id: @event.id, invite_status: 'Accepted'})
    @attendees = User.where(id: @invites.pluck(:attendee_id))
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    puts @event
    @event.save
    redirect_to @event
  end

  private


  def event_params
    params.require(:event).permit(:title, :description, :date)
  end





end
