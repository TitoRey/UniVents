class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :user
  # This ensures that every Event has only one of every user that registers
  validates :user_id, uniqueness: { scope: :event_id }
  validate :host_cannot_register


  private 

  def host_cannot_register
    errors.add :base, 'Host cannot register for their own event!'
  end
end