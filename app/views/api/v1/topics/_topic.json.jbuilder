# frozen_string_literal: true

json.extract! topic, :id, :name, :image
json.url api_v1_topic_url(topic, format: :json)
