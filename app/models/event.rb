class Event < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_one :location
  has_many :event_users
  has_many :users, through: :event_users



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


end
