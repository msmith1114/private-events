class InviteMailer < ApplicationMailer
  default from: 'smith.matt1114@gmail.com'

  def invite_pending(user,invite)
     @user = user
     @invite = invite
     @event = Event.find(@invite.attended_event_id)
     mail to: user.email, subject: "Invitation pending for #{@event.title}"
  end
end
