class Api::Mobile::DancersController < ApplicationController
  :authenticate_api_mobile_user!, except: [:index, :show, ;]
  def index
    dancers = Dancer.where(admin.id: current_api_mobile_user)
    render json: dancers, status: :ok
  end

  def show
    dancer = Dancer.find_by(id: params[:dancer_id])
    render json: dancer, status: :ok
  end

  def create
    dancer = Dancer.new(dancer_params)
    dancer.user_id = current_api_mobile_user.id
    dancer.admin_id = Admin.find(registration_code: code).where(is_active: true).id
    if dancer.save
      render json: { status: :success, data: dancer }
    else
      render json: { status: :bad_request, message: 'Not updated' }
    end
  end

  def update
  end

  def delete
  end

  private

  def dancer_params
    params.require(:dancer).permit(:nickname, :age, :gender, :profile)
  end
  def admin_params
    params.require(:dancer).permit(admin:[:registration_code])
  end
end
