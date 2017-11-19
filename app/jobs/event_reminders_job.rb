class EventRemindersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    event = Event.find event_id
        if event.users.count == 0
          #send email to owner
        end
      end
end
