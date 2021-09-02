# frozen_string_literal: true

module Api
  module V1
    class TargetsController < ApplicationController
      # POST /targets or /targets.json 
      def create
        @target = current_user.targets.create!(target_params)
      end

      def index
        @targets = current_user.targets
      end

      private

      # Only allow a list of trusted parameters through.
      def target_params
        params.require(:target).permit(:title, :radius, :latitude, :longitude, :topic_id)
      end
    end
  end
end
