module Api
  module V1
    class TopicsController < ApplicationController

      # before_action :set_topic, only: %i[show edit update destroy]

      # GET /topics or /topics.json
      def index
        @topics = Topic.all
      end

=begin
      # GET /topics/1 or /topics/1.json
      def show
      end

      # GET /topics/new
      def new
        @topic = Topic.new
      end

      # GET /topics/1/edit
      def edit
      end

      # POST /topics or /topics.json
      def create
        @topic = Topic.new(topic_params)

        respond_to do |format|
          if @topic.save
            format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
            format.json { render :show, status: :created, location: api_v1_topic_url(@topic) }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @topic.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /topics/1 or /topics/1.json
      def update
        respond_to do |format|
          if @topic.update(topic_params)
            format.html { redirect_to @topic, notice: "Topic was successfully updated." }
            format.json { render :show, status: :ok, location: api_v1_topic_url(@topic) }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @topic.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /topics/1 or /topics/1.json
      def destroy
        @topic.destroy
        respond_to do |format|
          format.html { redirect_to api_v1_topics_url, notice: "Topic was successfully destroyed." }
          format.json { head :no_content }
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_topic
        begin
          @topic = Topic.find(params[:id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { 'message': e }.to_json, status: :not_found
        end
      end

      # Only allow a list of trusted parameters through.
      def topic_params
        params.permit(:name, :image)
      end
=end
    end
  end
end