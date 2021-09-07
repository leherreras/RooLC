# frozen_string_literal: true

module Helpers
  # Helper method to parse a response
  #
  # @return [Hash]
  def json
    JSON.parse(response.body)
  end

  def auth_headers
    @auth_headers ||= user.create_new_auth_token
  end

  def restart_unique_generator
    Faker::UniqueGenerator.clear
  end
end
