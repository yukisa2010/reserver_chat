class EventsController < ApplicationController

  def reserve
    event = Event.find_by(event_params)
    event.participant_id = current_user.id
    if event.save
      redirect_to user_events_path(current_user), notice: 'Success Reservation'
    else
      falsh.now[:alert] = event.errors.full_messages
      render request.referer
    end
  end

  def index
    @events = Event.where(participant_id: current_user.id)
  end

  def show
  end

  private
  def event_params
    params.require(:event).permit(:id)
  end
end
