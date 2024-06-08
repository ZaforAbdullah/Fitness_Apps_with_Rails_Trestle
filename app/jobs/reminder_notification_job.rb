class ReminderNotificationJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.reminder_notification(user).deliver_now
    
  end
end