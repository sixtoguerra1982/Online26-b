class EventsController < ApplicationController

  before_action :set_event, only: [:show, :update, :edit]

  def index
  	@events = Event.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        flash.now[:alert] = "Event #{@event.title} was successfully updated."
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :start, :end, :allday)
    end
end
