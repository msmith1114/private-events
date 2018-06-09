class User < ApplicationRecord

  has_many :events, foreign_key: :creator_id, dependent: :destroy
  has_many :invites, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :invites, dependent: :destroy
  before_save   :downcase_email
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  def upcoming_events
     self.attended_events.upcoming
  end

  def previous_events
    self.attended_events.past
  end

  def creator?(event)
    if event.creator_id == self.id
      return true
    else
      return false
    end
  end

  private

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end



end
