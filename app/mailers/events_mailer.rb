class EventsMailer < ApplicationMailer

  def notify_event_user_creator(event)
    @event = event
    @user = event.user
    mail(bcc: "#{@user.email}", subject: 'You have created a new event!')
  end


  def notify_event_user_join(event, current_user)
    @event = event
    @user = current_user
    mail(bcc: "#{@user.email}", subject: "You have joined #{event.title}!")

  end

  def notify_event_users_all(event, current_user)
    @event = event
    @user = current_user
    mail(bcc: "#{@user.email}", subject: 'Friendly reminder about the event tomorrow!')
  end
end
