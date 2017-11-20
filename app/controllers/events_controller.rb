class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index, :show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @event = Event.new
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @attending = @event.attending.find_by({user_id: current_user})

  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save

        format.html { redirect_to @event, notice: 'Event was successfully created.', :style => 'text-align: center;' }
        #EventRemindersJob.set(wait: 20.seconds).perform_later(@event)

        EventsMailer.notify_event_user_creator(@event).deliver_now
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.', :style => 'text-align: center;'  }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time, :location)
    end
end
