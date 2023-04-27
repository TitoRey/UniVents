class Event < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_one :location
  has_many :event_users
  has_many :users, through: :event_users

  after_create :owner_email_confirmation



  def users_signed_up
    users.where(active: true).count
  end
  
  def owner_email
    user.email
  end

  def event_date_and_time
    event_time.strftime("%B %d, %Y (%I:%M %p)")
  end

  def all_users_signed_up
    users.where(active: true)
  end

  def flag(flag)
    update(flagged: flag)
  end

  private
  
  def owner_email_confirmation
    MainMailer.event_creation_confirmation(owner: user, event: self).deliver_now
  end


end
