class UserMailer < ApplicationMailer
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
     :address => "smtp.gmail.com",
     :port => 587,
     :domain => "gmail.com",
     :user_name => "alumnuts@gmail.com",
     :password => "alumnuts_dasha",
     :authentication => "plain",
     :enable_starttls_auto => true
  }
  def invite_email(email, creator, challenge)
    @email = email
    @creator = creator
    @challenge = challenge
    mail(to: @email, subject: "You've been challenged")
  end
end
