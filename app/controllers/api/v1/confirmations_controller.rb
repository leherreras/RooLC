module Api
  module V1
    class ConfirmationsController < DeviseTokenAuth::ConfirmationsController

      def show
        @resource = resource_class.confirm_by_token(resource_params[:confirmation_token])

        if @resource.errors.empty?
          yield @resource if block_given?

          redirect_header_options = { account_confirmation_success: true }
          render json: redirect_header_options, status: :ok

        else
          render json: { message: I18n.t('api.errors.not_found') }, status: :not_found
        end
      end

      private

      def resource_params
        params.permit(:email, :confirmation_token, :config_name, :redirect_url, :config)
      end

    end
  end
end
