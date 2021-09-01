# frozen_string_literal: true

json.extract! target, :id, :title, :radius, :latitude, :longitude, :topic_id, :user_id, :created_at, :updated_at
json.url api_v1_target_url(target, format: :json)
