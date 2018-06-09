class InviteMailer < ApplicationMailer
  default from: 'notifications@private-events.com'

  def invite_pending(user,invite)
     @user = user
     @invite = invite
     @event = Event.find(@invite.attended_event_id)
     mail to: user.email, subject: "Invitation pending for #{@event.title}"
  end
end
