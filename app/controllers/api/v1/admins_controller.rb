class Api::V1::AdminsController < ApplicationController
  def update
    admin = Admin.find(current_api_v1_admin)
    if admin.update(admin_params)
      render json: { status: :ok, data: admin }
    else
      render json: { status: :bad_request, data: errors }
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :area, :sub_area, :is_recruitment, :is_active, :registration_code)
  end
end
