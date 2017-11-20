class AttendingController < ApplicationController

  def create
    event = Event.find params[:event_id]
    attending = Attending.new(user: current_user, event: event)
    if(attending.save)
      EventsMailer.notify_event_user_join(event, current_user).deliver_now
      send_date = event.start_time - 1.day
      minutes_from_now = (send_date.to_i- Time.now.to_i) / 60
      p minutes_from_now
      EventRemindersJob.set(wait: minutes_from_now.minute).perform_later(event, current_user)
      redirect_to event, notice: "Thanks for signing up!"
    else
      redirect_to event, notice: "You are already attending"
    end
  end

  def destroy
    attending = Attending.find params[:id]
    attending.destroy
    redirect_to attending.event, notice: "Removed from event"
  end


end
