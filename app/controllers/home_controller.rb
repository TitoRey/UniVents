class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    @popular_events = Event.all.sort_by { |event| -event.users_signed_up }.take(5)

    @upcoming_events = Event.where("event_time >= ?", Date.today).order(event_time: :asc).limit(5)
  end
end