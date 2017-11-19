class EventRemindersJob < ApplicationJob
  queue_as :default

  def perform(event)
    @event = Event.find event.id
        #if event.users.count == 0
          #send email to owner
        #end
    #recipients = [@user.email, 'bangotran21@gmail.com', 'wonpark89@gmail.com', 'dashosh91@gmail.com']
    #mail(bcc: recipients, subject: 'You have signed up for a new event!')
    p "i m in perform"
    p "------------------------------------------"
    EventsMailer.notify_event_user_creator(@event).deliver_later

      end
end
