class MainMailer < ApplicationMailer
  FROM_ADDRESS = 'univentsmailer@gmail.com'

  def new_account_creation(user:)
    @user = user
    mail from: FROM_ADDRESS, to: @user.email, subject: 'Welcome to UniVents!'
  end

  def event_creation_confirmation(owner:, event:)
    @user = owner
    @event = event
    mail from: FROM_ADDRESS, to: @user.email, subject: "#{@event.event_name} has been created!"
  end


end