class InvitesController < ApplicationController
  before_action :require_login, only: [:create]


  def create
    attendee = User.find_by(email: params[:invite][:email])
    @event = Event.find(params[:event])
    @invite = @event.invites.build(attendee_id: attendee.id )
    if @invite.save
      InviteMailer.invite_pending(attendee,@invite).deliver_now
      flash[:success] = "#{attendee.name} successfully invited!"
      redirect_to events_path
    else
      redirect_to @event
    end
  end

  def accept
    @invite = Invite.find_by(invite_code: params[:id])
    @invite.update_attributes(invite_status: 'Accepted')
    flash[:success] = "Invitation Accepted!"
    redirect_to root_url
  end

  def deny
    @invite = Invite.find_by(invite_code: params[:id])
    @invite.update_attributes(invite_status: 'Rejected')
    flash[:warning] = "You have rejected the Invite successfully"
    redirect_to root_url
  end

  private

  def invite_params
    params.require(:user).permit(:email)
  end


end
