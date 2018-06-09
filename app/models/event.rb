class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :invites, foreign_key: :attended_event_id
  has_many :attendees, through: :invites, dependent: :destroy
  scope :upcoming, -> { where("Date >= ?", DateTime.now).order('Date ASC') }
  scope :past, 	 -> { where("Date <  ?", DateTime.now).order('Date DESC') }

  def attendance_count
    @accepted = Invite.where({attended_event_id: self.id, invite_status: 'Accepted'})
    @accepted.count
  end


end
