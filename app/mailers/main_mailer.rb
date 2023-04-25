class MainMailer < ApplicationMailer
  FROM_ADDRESS = 'univentsmailer@gmail.com'

  def new_account_creation(user:)
    @user = user
    mail from: FROM_ADDRESS, to: @user.email, subject: "Welcome to UniVents!"
  end


end