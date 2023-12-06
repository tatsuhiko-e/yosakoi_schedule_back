class Api::Mobile::EventsController < ApplicationController
  before_action :authenticate_api_mobile_user!, only: [:create, :index]

  def index
    dancer = Dancer.find_by(id: params[:dancer_id])
    events = Event.where(admin_id: dancer.admin_id)
    render json: events, status: :ok
  end

  def create
    event = Event.new(event_params)
    dancer = Dancer.find(params[:dancer_id])
    event.dancer_id = dancer.id
    event.admin_id = dancer.admin_id
    if event.save
      render json: { status: :success, data: event }
    else
      render json: { status: :bad_request, message: 'Not created' }
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :area, :context, :status, :release_flag)
  end
end
