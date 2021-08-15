# frozen_string_literal: true

json.array! @topics, partial: 'api/v1/topics/topic', as: :topic
