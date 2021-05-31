class Admin::EventsController < ApplicationController

  def new
    @event = Event.new
    @time = Time.now
    @plan = current_user.plans.find(params[:plan_id])
  end

  def create
    plan = current_user.plans.find(params[:plan_id])
    @time = create_datetime(datetime_params)
    event = plan.events.new(scheduled_datetime: @time, organizer_id: current_user.id)
    if event.save
      redirect_to admin_user_plan_path(current_user, plan), notice: 'Success'
    else
      flash.now[:alert] = event.errors.full_messages
      render 'new'
    end
  end

  def index
    @events = Event.where(organizer_id: current_user.id)
  end


  def accept
    event = Event.find(params[:event_id])
    event.accepted!
    redirect_to request.referrer, notice: 'accepted event'
  end

  def refuse
    event = Event.find(params[:event_id])
    event.not_offerred!
    redirect_to request.referrer, notice: 'refused event'
  end

  private

    def datetime_params
      params.require(:event).permit(:year, :month, :day, :hour,:minute)
    end

    def create_datetime(params)
      time_data = [params[:year], params[:month], params[:day], params[:hour], params[:minute], 0]
      Time.zone.local(*time_data)
    end
end
