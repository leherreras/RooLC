module Api
  module V1
    class PasswordsController < DeviseTokenAuth::PasswordsController
      def edit
        # if a user is not found, return nil
        @resource = resource_class.with_reset_password_token(resource_params[:reset_password_token])

        if @resource && @resource.reset_password_period_valid?
          token = @resource.create_token unless require_client_password_reset_token?

          # ensure that user is confirmed
          @resource.skip_confirmation! if confirmable_enabled? && !@resource.confirmed_at
          # allow user to change password once without current_password
          @resource.allow_password_change = true if recoverable_enabled?

          @resource.save!

          yield @resource if block_given?

          if require_client_password_reset_token?
            redirect_to DeviseTokenAuth::Url.generate(@redirect_url, reset_password_token: resource_params[:reset_password_token])
          else

            render json: { 'access-token': token.token,
                           client: token.client,
                           reset_password: true }
          end
        else
          render json: { message: I18n.t('api.errors.not_found') }, status: :not_found
        end
      end

      private

      def resource_params
        params.permit(:email, :reset_password_token, :redirect_url, :config)
      end
    end
  end
end

