# frozen_string_literal: true

module Api
  module V1
    class TargetsController < ApplicationController
      before_action :set_target, only: %i[show edit update destroy]

      # GET /targets or /targets.json
      def index
        @targets = Target.all
      end

      # GET /targets/1 or /targets/1.json
      def show
      end

      # POST /targets or /targets.json
      def create
        @target = Target.new(target_params)

        respond_to do |format|
          if @target.save
            format.json { render :show, status: :created, location: @target }
          else
            format.json { render json: @target.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /targets/1 or /targets/1.json
      def update
        respond_to do |format|
          if @target.update(target_params)
            format.json { render :show, status: :ok, location: @target }
          else
            format.json { render json: @target.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /targets/1 or /targets/1.json
      def destroy
        @target.destroy
        respond_to do |format|
          format.html { redirect_to api_v1_targets_url, notice: 'Target was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_target
        @target = Target.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def target_params
        params.require(:target).permit(:title, :radius, :latitude, :longitude, :topic_id, :user_id)
      end
    end
  end
end
