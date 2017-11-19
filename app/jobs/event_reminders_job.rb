class EventRemindersJob < ApplicationJob
  queue_as :default

  def perform(event, current_user)
    @event = Event.find event.id
    @user = current_user
    #recipients = [@user.email, 'bangotran21@gmail.com', 'wonpark89@gmail.com', 'dashosh91@gmail.com']
    #mail(bcc: recipients, subject: 'You have signed up for a new event!')
    EventsMailer.notify_event_users_all(@event, @user).deliver_later
  end

end
