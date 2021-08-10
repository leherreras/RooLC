module Api
  module V1
    class TopicsController < ApplicationController

      # before_action :set_topic, only: %i[show edit update destroy]

      # GET /topics or /topics.json
      def index
        @topics = Topic.all
      end

    end
  end
end
