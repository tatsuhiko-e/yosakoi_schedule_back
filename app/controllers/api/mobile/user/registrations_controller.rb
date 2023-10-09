module Api
  module Mobile
    module User
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        private

        def sign_up_params
          params.permit(:email, :password, :password_confirmation, :name, :phone_number)
        end
      end
    end
  end
end
