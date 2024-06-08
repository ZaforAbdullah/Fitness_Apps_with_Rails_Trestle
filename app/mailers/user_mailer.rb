class UserMailer < ApplicationMailer
    default from: 'no-reply@fitnesstracker.com'
  
    def reminder_notification(user)
      @user = user
      mail(to: @user.email, subject: 'Reminder to log your activities')
    end
  end
  