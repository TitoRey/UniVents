class Event < ApplicationRecord
  belongs_to :owner, foreign_key: :user_id
  has_one :location
  has_many :event_users
  has_many :users, through: :event_users
end
