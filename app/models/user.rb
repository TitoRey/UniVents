class User < ApplicationRecord
  has_many :event_users
  has_many :events, through: :event_users


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  # Returns the boolean value on the admin attribute
  def is_admin?
    admin
  end

  # Returns first_name concatted with last_name
  def full_name
    "#{first_name} #{last_name}"
  end

  def events_signed_up_for
    event_users.count
  end

  def upcoming_signed_up_event
    # Grab first signed up event
  end

  def total_signed_up_events
    # Grabbed total events that user has been signed up
  end

  

  
end
