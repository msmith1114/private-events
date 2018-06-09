class Invite < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :attended_event, class_name: "Event"
  before_create :generate_invite_code

  def generate_invite_code
    self.invite_code = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

end
