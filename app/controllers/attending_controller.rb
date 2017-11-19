class AttendingController < ApplicationController

  def create
    event = Event.find params[:event_id]
    attending = Attending.new(user: current_user, event: event)
    if(attending.save)
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

  private

end
