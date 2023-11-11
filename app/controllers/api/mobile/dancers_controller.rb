class Api::Mobile::DancersController < ApplicationController
  before_action :authenticate_api_mobile_user!, only: [:index, :show, :create, :destroy]

  def index
    dancers = Dancer.where(id: current_api_mobile_user.id)
    render json: dancers, status: :ok
  end

  def show
    dancer = Dancer.find_by(id: params[:id])
    render json: { status: :success, data: dancer }
  end

  def create
    dancer = Dancer.new(dancer_params)
    dancer.user_id = params[:user_id]
    if dancer.save
      render json: { status: :success, data: dancer }
    else
      render json: { status: :bad_request, message: 'Not created' }
    end
  end

  def update
    dancer = Dancer.find_by(id: params[:id])
    if dancer.update(dancer_params)
      render json: { status: :success, data: dancer }
    else
      render json: { status: :bad_request, message: 'Not updated' }
    end
  end

  def destroy
    dancer = Dancer.find_by(id: params[:id])
    if dancer.destroy
      render json: { status: :success }
    else
      render json: { status: :bad_request, message: 'Not deleted' }
    end
  end

  private

  def dancer_params
    params.require(:dancer).permit(:nickname, :age, :gender, :profile, :registration_code)
  end
end
