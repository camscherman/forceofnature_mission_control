class EventsMailer < ApplicationMailer

  def notify_event_user_creator(event)
    @event = event
    @user = event.user
    recipients = [@user.email, 'bangotran21@gmail.com', 'wonpark89@gmail.com', 'dashosh91@gmail.com']
    mail(bcc: recipients, subject: 'You have signed up for a new event!')
  end


  def notify_event_user_join(event)

  end

  def notify_event_users_all(event)

  end
end
