# frozen_string_literal: true

module Api
  module V1
    # Override the registration class to accept the gender parameter
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      def create
        super
      rescue ArgumentError => e
        render json: { message: e }.to_json, status: :not_acceptable
      end

      private

      def sign_up_params
        params.permit(:gender, *params_for_resource(:sign_up))
      end
    end
  end
end
