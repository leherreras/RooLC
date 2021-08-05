class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController

  private

  def sign_up_params
    params.permit(:gender, *params_for_resource(:sign_up))
  end
end
