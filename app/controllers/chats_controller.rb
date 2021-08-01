class ChatsController < ApplicationController
  before_action :get_event

  def index
    @event = Event.find_by(id: params[:event_id])
    @chat = @event.chats.new
  end

  def create
    chat = Chat.new(content: chat_params[:content], event_id: @event.id, sender_id: current_user.id, receiver_id: @event.organizer_id)
    if chat.save
      redirect_to request.referrer, notice: 'Success'
    else
      flash.now[:alert] = "Submit failed"
      render 'index'
    end

  end

  private
    def chat_params
      params.require(:chat).permit(:content)
    end

    def get_event
      @event = Event.find_by(id: params[:event_id])
    end

end
