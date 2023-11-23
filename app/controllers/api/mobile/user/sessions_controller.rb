# frozen_string_literal: true

module Api
  module V1
    module Mobile
      class SessionsController < ApplicationController
        before_action :configure_sign_in_params, only: [:create]

        def index
          if current_api_v1_user
            render json: { is_login: true, data: current_api_mobile_user }
          else
            render json: { is_login: false, message: 'ユーザーが存在しません' }
          end
        end

        protected
      
        def configure_sign_in_params
          devise_parameter_sanitizer.permit(:sign_in, keys: [:phone_number])
        end
      end
    end
  end
end
