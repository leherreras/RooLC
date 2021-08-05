module Api
  module V1
    class RegistrationsController < DeviseTokenAuth::RegistrationsController

      private

      def sign_up_params
        params.permit(:gender, *params_for_resource(:sign_up))
      end
    end
  end
end
